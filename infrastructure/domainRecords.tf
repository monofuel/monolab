## NB. importing old records from linode, unsure which are still in use

resource "namecheap_record" "monofuel-dev" {
  # NB. is this one right? or is it actually monofuel.dev.monofuel.dev on mistake
  name    = "monofuel.dev"
  domain  = "monofuel.dev"
  address = "13.35.125.129"
  type    = "A"
}

resource "namecheap_record" "farmlife-monofuel-dev" {
  name    = "farmlife"
  domain  = "monofuel.dev"
  address = "13.35.125.129"
  type    = "A"
}

# DnD
resource "namecheap_record" "foundry-monofuel-dev" {
  name    = "foundry"
  domain  = "monofuel.dev"
  address = "54.183.103.40"
  type    = "A"
}

# Plex 'n chill
resource "namecheap_record" "plex-monofuel-dev" {
  name    = "plex"
  domain  = "monofuel.dev"
  address = "157.131.99.30"
  type    = "A"
}

resource "namecheap_record" "vpn-monofuel-dev" {
  name    = "vpn"
  domain  = "monofuel.dev"
  address = "52.53.100.69"
  type    = "A"
}

resource "namecheap_record" "cf_monofuel-dev" {
  domain = "monofuel.dev"
  name   = "*"
  # TODO automate address with aws provider
  address = "d3ahrr8xpnvrfs.cloudfront.net."
  type    = "CNAME"
}

resource "namecheap_record" "cf-www_monofuel-dev" {
  domain = "monofuel.dev"
  name   = "www"
  # TODO automate address with aws provider
  address = "d3ahrr8xpnvrfs.cloudfront.net."
  type    = "CNAME"
}

resource "namecheap_record" "cf-api-fintool_monofuel-dev" {
  domain = "monofuel.dev"
  name   = "api.fintool"
  # TODO automate address with aws provider
  address = "devqsfj0s5pnc.cloudfront.net."
  type    = "CNAME"
}

resource "namecheap_record" "cf-www-fintool_monofuel-dev" {
  domain = "monofuel.dev"
  name   = "www.fintool"
  # TODO automate address with aws provider
  address = "d3hyagl4v28dl.cloudfront.net."
  type    = "CNAME"
}





