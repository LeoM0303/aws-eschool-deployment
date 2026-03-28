-- eSchool Database Setup
-- Usage: DB_USER=eschool DB_PASS=yourpassword envsubst < app_configs/db_setup.sql | sudo mysql

CREATE DATABASE IF NOT EXISTS eschool;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON eschool.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
