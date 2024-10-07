
resource "random_id" "tunnel_secret" {
  byte_length = 16
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "tun1" {
  account_id  = var.account_id
  name        = var.tunnel_name
  secret      = random_id.tunnel_secret.b64_std
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tun1_config" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tun1.id
  config {
    warp_routing {
      enabled = true
    }
    origin_request {
      connect_timeout          = "1m0s"
      tls_timeout              = "1m0s"
      tcp_keep_alive           = "1m0s"
      # no_happy_eyeballs        = false
      keep_alive_connections   = 1024
      keep_alive_timeout       = "1m0s"
      # http_host_header         = "baz"
      # origin_server_name       = "foobar"
      # ca_pool                  = "/path/to/unsigned/ca/pool"
      no_tls_verify            = true
      # disable_chunked_encoding = false
      # bastion_mode             = false
      proxy_address            = "10.0.0.1"
      proxy_port               = "8123"
      proxy_type               = "socks"
      # ip_rules {
      #   prefix = "/web"
      #   ports  = [443]
      #   allow  = true
      # }
    }
    ingress_rule {
      # Hostname to match the incoming request with
      hostname = "kash"
      path     = "/service2"
      service  = "http://10.0.0.2:8080"
      origin_request {
        connect_timeout = "2m0s"
        access {
          required  = true
          # team_name = "XYZ"
        }
      }
    }
    ingress_rule {
      # Hostname to match the incoming request with
      hostname = "kash"
      service = "https://10.0.0.3:8081"
      origin_request {
        connect_timeout = "2m0s"
        access {
          required  = true
          # team_name = "XYZ"
        }
      }
    }
    ingress_rule {
      service = "http_status:404"
      # hostname = "foo"
      }
    }
}

# Allowing access to `test@example.com` email address only
resource "cloudflare_zero_trust_access_group" "geo_policy" {
  account_id = var.account_id
  name       = var.geo_policy_name

  include {
    geo = [ au, in ]
  }
}

# Allowing access to `test@example.com` email address only
resource "cloudflare_zero_trust_access_group" "mail_policy" {
  account_id = var.account_id
  name       = var.mail_policy_name

  include {
    email = [ "kashyapvijayperth@gmail.com" ]
  }
}


resource "cloudflare_zero_trust_access_application" "app1" {
  zone_id                   = var.zone_id
  name                      = var.application1_name
  domain                    = var.subdomain
  type                      = "self_hosted"
  session_duration          = "4h"
  auto_redirect_to_identity = false
  policies                  = [
      cloudflare_zero_trust_access_group.mail_policy.id,
      cloudflare_zero_trust_access_group.geo_policy.id
  ]
}