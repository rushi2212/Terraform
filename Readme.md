# Terraform AWS Deployment Project

## About

This project is about deploying a Flask backend and Express frontend on AWS using Terraform.

I completed the deployment in three ways:

1. Flask and Express on one EC2 instance
2. Flask and Express on separate EC2 instances
3. Flask and Express using Docker, ECR, ECS and VPC

I also tested both applications locally using Docker Compose.

## Technologies Used

* Python
* Flask
* Node.js
* Express.js
* Docker
* Docker Compose
* AWS EC2
* AWS ECR
* AWS ECS
* AWS VPC
* AWS IAM
* Terraform
* GitHub Actions


## Part 1 - Single EC2

Both applications were deployed on one EC2 instance.

* Flask runs on port `5000`
* Express runs on port `3000`


## Part 2 - Separate EC2

Two EC2 instances were used.

* Frontend EC2 → Express → `3000`
* Backend EC2 → Flask → `5000`



Security Groups were configured to allow the required communication.

## Part 3 - Docker and ECS

Both applications were containerized using Docker.

```text
Flask → Docker → ECR → ECS
Express → Docker → ECR → ECS
```

For this deployment I used:

* Amazon ECR
* Amazon ECS Fargate
* Amazon VPC
* Application Load Balancer
* IAM

The ALB routes:

```text
/api/* → Flask
/*      → Express
```


## Docker Compose

I used Docker Compose for local testing.

Start:

```bash
docker compose up --build
```

Stop:

```bash
docker compose down
```

Applications:

```text
Frontend: http://localhost:3000
Backend:  http://localhost:5000
```

Health check:

```text
http://localhost:5000/health
```


## Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Create execution plan:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Remove resources when no longer required:

```bash
terraform destroy
```

## Terraform Files

The Terraform configuration is kept simple using three files:

* `main.tf` - AWS infrastructure
* `variables.tf` - Terraform variables
* `outputs.tf` - Deployment outputs


## Security

The applications use:

* Port `22` for SSH
* Port `3000` for Express
* Port `5000` for Flask
* Port `80` for the ALB

SSH access should be restricted to my IP when possible.

AWS credentials are not stored in the project files.




