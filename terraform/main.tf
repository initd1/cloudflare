provider "cloudflare" {
    api_token = var.cloudflare_api_token
}

resource "cloudflare_waf_rule" "waf_rule" {
    zone_id = var.zone_id
  filter {
    expression  = var.waf_expression
    paused      = false
    description = var.waf_description
  }

  action = "block"
}