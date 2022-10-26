output "wordpress_admin_password" {
  value = random_password.password
  sensitive = true
}

output "wordpress_ecr_repository" {
  value = module.wordpress_website.wordpress_ecr_repository
}

output "wordpress_cloudfront_ssl_arn" {
  value = module.wordpress_website.cloudfront_ssl_arn
}

output "wordpress_codebuild_project_name" {
  value = module.wordpress_website.codebuild_project_name
}

output "route53_apex" {
  value = aws_route53_zone.apex.arn
}

output "ecr_repo_url" {
  value = module.docker_pullpush.ecr_repo_url
}
