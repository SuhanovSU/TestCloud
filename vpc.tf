module "vpc" {
  source                             = "git@github.com:terraform-yc-modules/terraform-yc-vpc.git"
  network_name                       = "${var.deployment_prefix}-vpc"
  private_subnets                    = [{
    name = "subnet-1"
    zone = var.ya_zone
    v4_cidr_block = ["10.23.0.0/19"]
  }, 
  {
    name = "subnet-2"
    zone = var.ya_zone
    v4_cidr_block = ["10.23.32.0/19"]
  },
  {
    name = "subnet-3"
    zone = var.ya_zone
    v4_cidr_block = ["10.23.64.0/19"]
  }
  ]
}
