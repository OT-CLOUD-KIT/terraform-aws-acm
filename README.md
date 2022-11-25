# Amazon Certificate Manager

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/200x100/https://www.opstree.com/images/og_image8.jpg
  - This terraform module will create a complete ACM setup.
  - This project is a part of opstree's ot-aws initiative for terraform modules.


## Usage

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

## Local tags are used to define common tags. 
locals {
  tags = { "Environment" : "test", "Client" : "DevOps", "Project" : "Demo", "Organisation" : "opstree" }
}

#Create simple Redis cluster with one node in disabled mode.
module "Acm" {
  source                            = "./"

  create_root_domain_acm_certifcate = var.create_root_domain_acm_certifcate
  domain_names                      = var.domain_names
  tags                              = locals.tags
}


```

## Inputs

| Name | Description | Type | Default | Required | Supported |
|------|-------------|:----:|---------|:--------:|:---------:|
| create_root_domain_acm_certifcate | Bool value to create acm certificate. | `bool` | | yes | |
| domain_names | The name of the domainp. | `list(string)` | | yes | |
| tags | Tags of resource | `map(any)` | | yes | |

