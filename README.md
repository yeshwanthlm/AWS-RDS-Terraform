# AWS-RDS-Terraform
AWS RDS Instance with read-replica using Terraform

### Architecture:

<img width="732" alt="Screenshot 2024-04-22 at 10 21 43 PM" src="https://github.com/yeshwanthlm/AWS-RDS-Terraform/assets/66474973/0790a16a-79b8-4b77-9131-969cd8d9af88">

## Install postgresql and Connect from EC2

```bash
sudo apt-get install -y postgresql
```

```bash
psql --host=mypostgresql.c6c8mwvfdgv0.us-west-2.rds.amazonaws.com --port=5432 --username=awsuser --password --dbname=mypgdb
```

Reference Doc: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html




