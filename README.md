# eSchool AWS Deployment

## Overview
This project deploys the eSchool Java web application on AWS using Terraform, with a separate MySQL database server.

## Architecture
- **Web Server (EC2):** Ubuntu 22.04, t3.micro — runs eSchool Spring Boot app on port 8080
- **DB Server (EC2):** Ubuntu 22.04, t3.micro — runs MySQL 8.0
- **Security Groups:** Web SG (ports 22, 8080), DB SG (port 22, 3306 from web SG only)

## Prerequisites
- AWS CLI configured
- Terraform installed
- SSH key pair

## Deployment

### 1. IAM Setup
```bash
./setup_iam.sh
```

### 2. Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

### 3. Database Setup (on DB instance)
```bash
sudo mysql < app_configs/db_setup.sql
```

### 4. Application Setup (on Web instance)
```bash
git clone https://github.com/yurkovskiy/eSchool
cd eSchool
mvn clean package -DskipTests
sudo cp app_configs/eschool.service /etc/systemd/system/
sudo systemctl enable eschool
sudo systemctl start eschool
```

## Access
- URL: `http://<web_instance_ip>:8080`
- Login: `admin` / `admin`

## SSH Access
After `terraform apply`, use the output commands:
```bash
terraform output ssh_web
terraform output ssh_db
```
