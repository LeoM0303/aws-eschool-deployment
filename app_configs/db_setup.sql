CREATE DATABASE IF NOT EXISTS eschool;
CREATE USER IF NOT EXISTS 'eschool'@'%' IDENTIFIED WITH mysql_native_password BY 'StrongPass123!';
GRANT ALL PRIVILEGES ON eschool.* TO 'eschool'@'%';
FLUSH PRIVILEGES;
