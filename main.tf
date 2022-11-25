//Create an ACM Certificate - root domain
resource "aws_acm_certificate" "root_domain_certificate" {
  for_each          = var.create_root_domain_acm_certifcate ? toset(var.domain_names) : []
  domain_name       = each.value
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
  tags = merge(
    var.tags
  )
}

# //Add DNS records for Validation - root domain
# resource "aws_route53_record" "root_domain_cert_record" {
#   for_each        = var.create_root_domain_acm_certifcate ? toset(var.root_domain_names) : []
#   allow_overwrite = true
#   name            = tolist(aws_acm_certificate.root_domain_certificate[each.value].domain_validation_options)[0].resource_record_name
#   records         = [tolist(aws_acm_certificate.root_domain_certificate[each.value].domain_validation_options)[0].resource_record_value]
#   type            = tolist(aws_acm_certificate.root_domain_certificate[each.value].domain_validation_options)[0].resource_record_type
#   zone_id         = data.aws_route53_zone.root_domain_zone_id[each.value].zone_id
#   ttl             = 60
# }

# //Validate the certificate - root domain
# resource "aws_acm_certificate_validation" "root_domain_cert_validate" {
#   for_each                = var.create_root_domain_acm_certifcate ? toset(var.root_domain_names) : []
#   certificate_arn         = aws_acm_certificate.root_domain_certificate[each.value].arn
#   validation_record_fqdns = [aws_route53_record.root_domain_cert_record[each.value].fqdn]
# }

# //Create an ACM Certificate - sub domain
# resource "aws_acm_certificate" "sub_domain_certificate" {
#   for_each          = { for zone in local.helper_list : zone.sub_domain => zone }
#   domain_name       = each.value.sub_domain
#   validation_method = "DNS"
#   lifecycle {
#     create_before_destroy = true
#   }
#   tags = merge(
#     {
#       Name = format("%s", each.value.sub_domain)
#     },
#     var.tags,
#   )
# }


# //Add DNS records for Validation - sub domain
# resource "aws_route53_record" "sub_domain_cert_record" {
#   for_each        = { for zone in local.helper_list : zone.sub_domain => zone }
#   allow_overwrite = true
#   name            = tolist(aws_acm_certificate.sub_domain_certificate[each.value.sub_domain].domain_validation_options)[0].resource_record_name
#   records         = [tolist(aws_acm_certificate.sub_domain_certificate[each.value.sub_domain].domain_validation_options)[0].resource_record_value]
#   type            = tolist(aws_acm_certificate.sub_domain_certificate[each.value.sub_domain].domain_validation_options)[0].resource_record_type
#   zone_id         = data.aws_route53_zone.sub_domain_zone_id[each.value.sub_domain].zone_id
#   ttl             = 60
# }

# //Validate the certificate - sub domain
# resource "aws_acm_certificate_validation" "sub_domain_cert_validate" {
#   for_each                = { for zone in local.helper_list : zone.sub_domain => zone }
#   certificate_arn         = aws_acm_certificate.sub_domain_certificate[each.value.sub_domain].arn
#   validation_record_fqdns = [aws_route53_record.sub_domain_cert_record[each.value.sub_domain].fqdn]
# }
