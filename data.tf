# //Extract root domain hosted zone ID
# data "aws_route53_zone" "root_domain_zone_id" {
#   for_each     = var.create_root_domain_acm_certifcate ? toset(var.root_domain_names) : []
#   name         = each.value
#   private_zone = false
# }

# //Extract sub domain hosted zone ID
# data "aws_route53_zone" "sub_domain_zone_id" {
#   for_each     = { for zone in local.helper_list : zone.sub_domain => zone }
#   name         = each.value.sub_domain
#   private_zone = false
  
# }