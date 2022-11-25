variable "create_root_domain_acm_certifcate" {
  type    = bool
  default = true
}

variable "domain_names" {
  description = "The name of the domain"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}


/* Example: 
    sub_domain_zone_names = {
      "simpplr.xyz" = {
        sub_domain_name = ["t5.simpplr.xyz", "t4.simpplr.xyz"]
      }
      "cloudforbeginners.com" = {
        sub_domain_name = ["qa.cloudforbeginners.com"]
      }
    } */
# variable "sub_domain_zone_names" {
#   description = "The name of the domain"
#   type = map(object({
#     sub_domain_name = list(string)
#   }))
#   default = {}
# }