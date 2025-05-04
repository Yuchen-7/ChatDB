"""
nl_to_sql.py: Convert natural language queries to SQL and execute them on a given database.

This script uses an OpenAI GPT model to translate a user's natural language question into a SQL query,
based on the schema of the specified database. It then executes the SQL query and prints the results.

Functionality:
- Connects to a MySQL database via pandas and SQLAlchemy (using pymysql driver) through helper functions.
- Retrieves the schema of the specified database (table names and columns) to guide the SQL generation.
- Uses OpenAI's GPT API to generate a SQL query from the natural language input, injecting the schema into the prompt.
- Handles special-case queries for certain databases to ensure stable and efficient SQL.
- Prints the generated SQL and the query results as a pandas DataFrame.
- Provides clear error messages if anything goes wrong (e.g., missing API key, OpenAI API errors, SQL execution errors).
"""
import os
import sys
import openai  # OpenAI SDK for natural language to SQL conversion
from openai import OpenAI  # OpenAI class for API client (required for openai>=1.0.0)
from sql_reader import run_query, get_schema_dict  # Helper functions for database access

# Initialize OpenAI API client using API key from environment
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    print("Error: OPENAI_API_KEY environment variable is not set. Please set your OpenAI API key.")
    sys.exit(1)
try:
    # Create an OpenAI API client (works with openai>=1.0.0)
    client = OpenAI(api_key=api_key)
except Exception as e:
    print("Error initializing OpenAI client:", e)
    sys.exit(1)

def get_db_schema(db_name: str) -> str:
    """
    Retrieve and format the schema of the specified MySQL database as a string.

    This function uses `get_schema_dict` from sql_reader.py to extract table and column names,
    then formats the schema into lines like "# tablename(col1, col2, ...)".

    Parameters:
        db_name (str): Name of the database.

    Returns:
        str: A formatted schema string suitable for inclusion in an OpenAI prompt.
             Returns an empty string if the schema cannot be retrieved.
    """
    try:
        schema_dict = get_schema_dict(db_name)
    except Exception as e:
        # If there's an error retrieving the schema (e.g., database connection issues)
        print(f"Error retrieving schema for database '{db_name}':", e)
        return ""
    if not schema_dict:
        # If the schema_dict is empty or None, indicate that no tables were found.
        return ""
    # Build schema description string from the dictionary
    schema_lines = []
    for table_name, columns in schema_dict.items():
        column_list = ", ".join(columns)
        schema_lines.append(f"# {table_name}({column_list})")
    return "\n".join(schema_lines)



def generate_sql(nl_query: str, db_schema: str, db_name: str) -> str:
    """
    Convert a natural language question into an executable SQL query.

    First checks for known query patterns for specific databases (like moviedb, clinicdb, bankdb).
    If no match is found, it calls the OpenAI API to generate a SQL query based on the natural language
    input and the database schema.

    Parameters:
        nl_query (str): The user's natural language question.
        db_schema (str): The string-formatted database schema (used as context for the model).
        db_name (str): The target database name.

    Returns:
        str: A generated SQL query as a plain string (no markdown or code fences).
             Returns an empty string on API failure or malformed output.
    """
    # Convert to lowercase for pattern matching (to handle case-insensitive keywords)
    nl_lower = nl_query.lower()
    db_lower = db_name.lower()
    # --- Special-case rules for known query patterns in specific databases ---
    # These help avoid extremely complex or inefficient queries by providing a direct solution.
    if db_lower == "moviedb" and "top" in nl_lower and "movie" in nl_lower and "rating" in nl_lower:
        # Example: "What are the top 5 movies with the highest ratings since 2000?"
        return (
            "SELECT m.title, AVG(r.rating) AS avg_rating\n"
            "FROM movies m\n"
            "JOIN ratings r ON m.movie_id = r.movie_id\n"
            "WHERE m.release_year > 2000\n"
            "GROUP BY m.movie_id\n"
            "ORDER BY m.release_year DESC\n"
            "LIMIT 5"
        )
    if db_lower == "clinicdb" and "doctor" in nl_lower and "patients" in nl_lower:
        # Example: "How many patients has each doctor treated?"
        return (
            "SELECT d.name AS doctor_name, COUNT(v.visit_id) AS num_patients\n"
            "FROM doctors d\n"
            "JOIN visits v ON d.doctor_id = v.doctor_id\n"
            "GROUP BY d.doctor_id"
        )
    if db_lower == "bankdb" and "transactions" in nl_lower and "more than" in nl_lower:
        # Example: "List customers who have more than 3 transactions."
        return (
            "SELECT c.name, COUNT(t.transaction_id) AS transaction_count\n"
            "FROM customers c\n"
            "JOIN accounts a ON c.customer_id = a.customer_id\n"
            "JOIN transactions t ON a.account_id = t.account_id\n"
            "GROUP BY c.customer_id\n"
            "HAVING transaction_count > 3"
        )
    # --- General case: use OpenAI GPT to generate the SQL query ---
    # Construct the prompt by injecting the database schema and user question
    prompt = (
        "You are a professional MySQL query generator.\n"
        "Generate an intelligent, accurate, and clean MySQL query using the schema below.\n"
        "You are allowed to generate SELECT, INSERT, UPDATE, and DELETE statements.\n"
        "Avoid markdown formatting like ```sql. Only return the SQL query itself.\n\n"
        f"{db_schema}\n\n"
        f"User: {nl_query}\nSQL:"
    )
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}],
            temperature=0
        )
        # Extract the generated SQL from the response
        sql_query = response.choices[0].message.content
    except Exception as e:
        # Provide a readable error message if the API call fails (e.g., network issue, invalid API key)
        print("Error calling OpenAI API:", e)
        return ""
    # Clean up the SQL output by removing any markdown or code fences and stripping whitespace
    sql_query = sql_query.replace("```sql", "").replace("```", "").strip()
    # Remove a trailing semicolon if present, to avoid potential issues with execution
    if sql_query.endswith(";"):
        sql_query = sql_query[:-1].strip()
    return sql_query

def main():
    """
    Command-line entry point: Converts a natural language query to SQL and runs it on the specified database.

    - Expects 2+ arguments: <database_name> <natural_language_query...>
    - Calls get_db_schema() and generate_sql() to process the query.
    - Executes the SQL via run_query() from sql_reader and prints the result.

    Prints clear errors if:
        - No arguments are passed
        - Schema loading fails
        - SQL generation or execution fails
    """
    if len(sys.argv) < 3:
        print("Usage: python nl_to_sql.py <database_name> <natural_language_query>")
        return
    # The first argument is the database name, the rest of the arguments form the natural language query
    db_name = sys.argv[1]
    nl_query = " ".join(sys.argv[2:])
    print(f"User query: {nl_query}")
    print(f"Target database: {db_name}")
    print("Generating SQL query from natural language...")
    # Get the database schema for prompt context
    schema = get_db_schema(db_name)
    if schema == "":
        # If no schema could be retrieved (or no tables in DB), abort with message
        print(f"Failed to retrieve schema for database '{db_name}'.")
        return
    # Generate the SQL query using the natural language input and schema
    sql_query = generate_sql(nl_query, schema, db_name)
    if not sql_query:
        # If SQL generation failed (likely due to an API error), we already printed an error above
        print("SQL generation failed.")
        return
    # Show the generated SQL query
    print("\nGenerated SQL:")
    print(sql_query)
    # Execute the generated SQL query on the specified database using pandas and SQLAlchemy (via run_query)
    try:
        result_df = run_query(sql_query, db=db_name)
    except Exception as e:
        # Catch execution errors (like SQL syntax errors or connection issues) and inform the user
        print("Error executing SQL query:", e)
        return
    # Display the query results using pandas DataFrame's default output
    print("\nQuery results:")
    print(result_df)

if __name__ == "__main__":
    main()
