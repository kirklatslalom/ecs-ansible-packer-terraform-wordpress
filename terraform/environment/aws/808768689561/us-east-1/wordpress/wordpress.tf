resource "random_password" "password" {
  length           = 16
  special          = true
}

module "wordpress_website" {
  source = "../../../../../modules/terraform-aws-serverless-static-wordpress"
  #version        = "0.1.2"
  main_vpc_id    = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids     = tolist(data.terraform_remote_state.vpc.outputs.public_subnets)
  aws_account_id = data.aws_caller_identity.current.account_id
  wordpress_admin_password = random_password.password.result

  # site_name will be used to prepend resource names - use no spaces or special characters
  site_name   = local.site_name
  site_domain = local.site_domain

  hosted_zone_id = aws_route53_zone.apex.id
  s3_region      = var.region

  ecs_cpu            = 1024
  ecs_memory         = 2048
  cloudfront_aliases = local.cloudfront_aliases
  waf_enabled        = true

  # Provides the toggle to launch Wordpress container
  launch = 0

  ## Passing in Provider block to module is essential
  providers = {
    aws.ue1 = aws
  }
}

# Optional (but highly recommended) helper module for pull/push official Wordpress docker image to ECR

module "docker_pullpush" {
  source = "TechToSpeech/ecr-mirror/aws"
  #version        = "0.0.6"
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = var.region
  docker_source  = "wordpress:php7.4-apache"
  aws_profile    = var.profile
  ecr_repo_name  = module.wordpress_website.wordpress_ecr_repository
  ecr_repo_tag   = "base"
  depends_on     = [module.wordpress_website]
}


# Optional helper resources to trigger CodeBuild

resource "null_resource" "trigger_build" {
  triggers = {
    codebuild_etag = module.wordpress_website.codebuild_package_etag
  }
  provisioner "local-exec" {
    command = "aws codebuild start-build --project-name ${module.wordpress_website.codebuild_project_name} --profile ${var.profile} --region ${var.region}"
  }
  depends_on = [
    module.wordpress_website, module.docker_pullpush
  ]
}


# Optional helper resources to update nameservers of newly-created Hosted Zone

resource "aws_route53_zone" "apex" {
  name = local.site_domain
}

resource "null_resource" "update_nameservers" {
  triggers = {
    nameservers = aws_route53_zone.apex.id
  }
  provisioner "local-exec" {
    command = "aws route53domains update-domain-nameservers --region us-east-1 --domain-name ${local.site_domain} --nameservers Name=${aws_route53_zone.apex.name_servers.0} Name=${aws_route53_zone.apex.name_servers.1} Name=${aws_route53_zone.apex.name_servers.2} Name=${aws_route53_zone.apex.name_servers.3} --profile ${var.profile}"
  }
  depends_on = [aws_route53_zone.apex]
}
