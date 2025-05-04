
# ChatDB: Natural Language Interface for Databases

ChatDB is a lightweight web-based system that allows users to interact with relational databases using natural language questions. The system translates user input into executable SQL queries using OpenAI’s GPT model and displays the result in a clean, interactive format.

---

## 🛠 Features

- Natural Language → SQL Query Translation
- Web interface (Flask) with input box and database selector
- Dynamic schema extraction
- Support for multiple MySQL databases (e.g., `clinicdb`, `bankdb`)
- Query result display using pandas

---

## 💻 Tech Stack

- **Backend**: Python, Flask
- **Database**: MySQL (via SQLAlchemy + PyMySQL)
- **Frontend**: HTML/CSS (Jinja2 templates)
- **Language Model**: OpenAI GPT-3.5-Turbo API
- **Data Handling**: pandas

---

## 📁 Project Structure

```
chatdb/
│
├── app.py                  # Main Flask app
├── nl_to_sql.py            # Handles NL → SQL generation
├── sql_reader.py           # SQL execution using SQLAlchemy + pandas
│
├── templates/              # Web interface (search bar + result table)
│   └── index.html
│
├── static/                 # Optional styling
│   └── style.css
│
├── chatdb_full_insert.sql            # Sample schema for clinicdb and bankdb
├── requirements.txt        # Python dependencies
└── README.md               # Project documentation
```

---

## 🧩 Databases Used

### 1. **clinicdb**

- **Tables**: `patients`, `appointments`, `doctors`, `treatments`
- **Schema Overview**:

```sql
CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY,
  name VARCHAR(100),
  specialty VARCHAR(100)
);

CREATE TABLE patients (
  patient_id INT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE
);

CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  date DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
  treatment_id INT PRIMARY KEY,
  appointment_id INT,
  description VARCHAR(100),
  FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);
```

- **Sample Data Snapshot**:

| appointment_id | patient_id | doctor_id | date       |
|----------------|------------|-----------|------------|
| 1              | 39         | 1         | 2024-10-08 |
| 2              | 39         | 3         | 2024-07-04 |

- **Example query**: `List all appointments with patient name.`

---

### 2. **bankdb**

- **Tables**: `customers`, `accounts`, `transactions`
- **Schema Overview**:

```sql
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE accounts (
  account_id INT PRIMARY KEY,
  customer_id INT,
  balance DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY,
  account_id INT,
  amount DECIMAL(10,2),
  timestamp DATE,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
```

- **Sample Data Snapshot**:

| transaction_id | account_id | amount  | timestamp   |
|----------------|------------|---------|-------------|
| 1              | 15         | 298.31  | 2025-03-15  |
| 2              | 37         | -195.59 | 2025-02-23  |

- **Example query**: `Show customer name and transaction amount.`

---

## 🚀 Setup Instructions

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd chatdb

# 2. Install dependencies
pip install -r requirements.txt

# 3. Start MySQL server and create databases (clinicdb, bankdb)
mysql -u root -p < clinicdb.sql
mysql -u root -p < bankdb.sql

# 4. Run the Flask application
python app.py
```

Then open your browser and go to: [http://127.0.0.1:5000](http://127.0.0.1:5000)

---

## 📬 Contact

Author: Yuchen Zhu
Email: yzhu1791@usc.edu
Instructor: Wensheng Wu
USC ID: 2244311522
