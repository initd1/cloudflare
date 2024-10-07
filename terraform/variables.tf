# This file describes the variable data types essentially and the .tfvars files store the variable values
variable "zone" {
  description = "The Domain used: kashyapvijay.com" 
  type        = string
}

variable "zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "account_id" {
  description = "Account ID for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "subdomain" {
  description = "Sub domain to be used for internal tunnel"
  type = string
}

variable "tunnel_name" {
  description = "Name of self-hosted tunnel"
  type = string
  
}
variable "api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive = true
}

variable "app_id" {
  description = "The Access Application ID"
  type        = string
}

variable "application1_name" {
  description = "Name of Application 1"
  type = string
}

variable "waf_expression" {
  description = "WAF rule expression"
  type        = string
}

variable "waf_description" {
  description = "Description of the WAF rule"
  type        = string
}



