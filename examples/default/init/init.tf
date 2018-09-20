provider "aws" {
  version = "1.36.0"
  region  = "eu-west-1"
}

locals {
  tags = {
    terraform   = "true"
    environment = "example"
    application = "sonarqube"
  }
}

module "sonarqube-init" {
  name_prefix = "sonarqube"
  source      = "../../../modules/init"
  tags        = "${local.tags}"
}

output "parameters_key_arn" {
  value = "${module.sonarqube-init.parameters_key_arn}"
}
