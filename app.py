from flask import Flask, request, render_template
from nl_to_sql import generate_sql
from nl_to_sql import get_db_schema
from sql_reader import run_query
from sql_reader import DB_CONFIG


app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    query = ''
    sql = ''
    result = None
    db_name = 'clinicdb' 

    if request.method == 'POST':
        query = request.form['query']
        db_name = request.form['db']
        db_schema = get_db_schema(db_name)
        sql = generate_sql(query, db_schema, db_name)
        result = run_query(sql, db=db_name)

    return render_template(
        'index.html',
        query=query,
        sql=sql,
        result=result,
        db=db_name
    )

if __name__ == '__main__':
    app.run(debug=True)