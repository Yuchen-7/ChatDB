import pandas as pd
from sqlalchemy import create_engine
import pymysql
from sqlalchemy import text


DB_CONFIG = {
    "user": "root",
    "password": "10270421Wm",        # Replace with your actual password
    "host": "127.0.0.1",             # Use 127.0.0.1 instead of localhost to avoid socket issues
    "port": 3306,
    "database": "moviedb"           # Default database (can be changed in function call)
}

def get_engine(db: str):
    """
    Create and return a SQLAlchemy engine connected to the specified MySQL database.

    Parameters:
        db (str): The name of the database to connect to.

    Returns:
        sqlalchemy.engine.base.Engine or None: The database engine if connection succeeds, otherwise None.
    """
    try:
        url = f"mysql+pymysql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{db}"
        return create_engine(url)
    except Exception as e:
        print(" Error creating engine:", e)
        return None



def run_query(query: str, db: str = "clinicdb") -> pd.DataFrame:
    """
    Executes a SQL query on the given MySQL database.
    For SELECT queries, returns a DataFrame.
    For INSERT/UPDATE/DELETE, executes and returns a success message.
    """
    db_url = f"mysql+pymysql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{db}"
    engine = create_engine(db_url)

    try:
        with engine.begin() as connection:  
            if query.strip().lower().startswith(("select", "show", "describe", "explain")):
                df = pd.read_sql(query, con=connection)
                return df
            else:
                connection.execute(text(query)) 
                return pd.DataFrame({"status": ["Success"]})
    except Exception as e:
        print("Error executing SQL query:", e)
        return pd.DataFrame({"error": [str(e)]})



def get_schema_dict(db: str) -> dict:
    """
    Retrieve the schema of the specified database, including all tables and their columns.

    Parameters:
        db (str): The name of the database to inspect.

    Returns:
        dict: A dictionary mapping each table name to a list of its column names.
              Example: {'patients': ['patient_id', 'name', 'dob'], ...}
    """
    engine = get_engine(db)
    if engine is None:
        return {}

    tables_query = f"SHOW TABLES;"
    try:
        table_names_df = pd.read_sql(tables_query, engine)
        table_column_map = {}

        for table in table_names_df.iloc[:, 0]: 
            columns_df = pd.read_sql(f"SHOW COLUMNS FROM {table};", engine)
            table_column_map[table] = list(columns_df["Field"])
        return table_column_map
    except Exception as e:
        print(" Failed to fetch schema:", e)
        return {}
