# locals {
#   helper_list = flatten([for root_domain, value in var.sub_domain_zone_names :
#     flatten([for sub_domain_name, subdomains in value :
#       [for sub_domain in subdomains :
#         {
#           "root_domain" = root_domain
#           "sub_domain"  = sub_domain
#         }
#     ]])
#   ])
# }