
resource "random_id" "tunnel_secret" {
  byte_length = 16
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "nfs_tunnel" {
  account_id  = var.account_id
  # name      = "${var.tunnel_name}"
  name        = var.tunnel_name
  secret      = random_id.tunnel_secret.b64_std
}

# resource "cloudflare_tunnel_config" "tunnel_config" {
#   tunnel_id = cloudflare_tunnel.my_tunnel.id
  
#   ingress_rules {
#     service = "http://localhost:8080" # Adjust this to your internal service's URL.
#     hostname = var.subdomain # e.g., admin.kashyapvijay.com
#     path     = "/"
#   }
# }

# resource "cloudflare_tunnel_config" "name" {
  
# }
# resource "cloudflare_waf_rule" "waf_rule" {
#   zone_id = var.zone_id
#   filter {
#     expression  = var.waf_expression
#     paused      = false
#     description = var.waf_description
#   }

#   action = "block"
# }