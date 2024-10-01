# This file describes the variable data types essentially and the .tfvars files store the variable values
variable "zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
}

variable "waf_expression" {
  description = "WAF rule expression"
  type        = string
}

variable "waf_description" {
  description = "Description of the WAF rule"
  type        = string
}



