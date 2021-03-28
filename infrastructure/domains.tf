resource "linode_domain" "japura" {
  domain    = "japura.net"
  type      = "master"
  soa_email = "admin@japura.net"
}

resource "linode_domain" "soggysquad" {
  domain    = "soggysquad.space"
  type      = "master"
  soa_email = "admin@soggysquad.space"
}

resource "linode_domain" "monofuel-dev" {
  domain    = "monofuel.dev"
  type      = "master"
  soa_email = "admin@japura.net"
}

resource "linode_domain_record" "lede" {
  domain_id   = "${linode_domain.monofuel-dev.id}"
  name        = "lede"
  record_type = "A"
  target      = "192.168.11.1"
  ttl_sec     = 3600
}