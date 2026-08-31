output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = aws_lb.main.dns_name
}


output "application_url" {
  description = "Main application URL"
  value       = "http://${aws_lb.main.dns_name}"
}

output "flask_url" {

  description = "Flask URL through ALB"
  value       = "http://${aws_lb.main.dns_name}/api/"
}

output "ecr_flask_repository" {
  description = "Flask ECR repository"
  value       = aws_ecr_repository.flask.repository_url
}

output "ecr_express_repository" {

  description = "Express ECR repository"
  value       = aws_ecr_repository.express.repository_url
}

output "ecs_cluster" {
  
  description = "ECS cluster"
  value       = aws_ecs_cluster.main.name
}