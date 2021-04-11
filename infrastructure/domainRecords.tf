## NB. importing old records from linode

# NB. all of this broke when my IP changed, updating the whitelist doesn't seem to help....

# resource "namecheap_record" "monofuel-dev" {
#   # NB. is this one right? or is it actually monofuel.dev.monofuel.dev on mistake
#   name    = "@"
#   domain  = "monofuel.dev"
#   address = "13.35.125.129"
#   type    = "A"
# }

# ## TODO
# resource "namecheap_record" "star_japura-net" {
#   name    = "*"
#   domain  = "japura.net"
#   address = "13.35.125.129"
#   type    = "A"
# }
# ## TODO
# resource "namecheap_record" "star_soggysquad-space" {
#   name    = "*"
#   domain  = "soggysquad.space"
#   address = "13.35.125.129"
#   type    = "A"
# }


# ### Servers

# resource "namecheap_record" "farmlife-monofuel-dev" {
#   name    = "farmlife"
#   domain  = "monofuel.dev"
#   address = var.farmlife_ip
#   type    = "A"
# }

# # DnD
# resource "namecheap_record" "foundry-monofuel-dev" {
#   name    = "foundry"
#   domain  = "monofuel.dev"
#   address = "54.183.103.40"
#   type    = "A"
# }

# # Plex 'n chill
# resource "namecheap_record" "plex-monofuel-dev" {
#   name    = "plex"
#   domain  = "monofuel.dev"
#   address = var.home_ip
#   type    = "A"
# }

# resource "namecheap_record" "vpn-monofuel-dev" {
#   name    = "vpn"
#   domain  = "monofuel.dev"
#   address = "52.53.100.69"
#   type    = "A"
# }

# ### Cloudfront cnames

# resource "namecheap_record" "cf_monofuel-dev" {
#   domain = "monofuel.dev"
#   name   = "*"
#   # TODO automate address with aws provider
#   address = "d3ahrr8xpnvrfs.cloudfront.net."
#   type    = "CNAME"
# }

# resource "namecheap_record" "cf-www_monofuel-dev" {
#   domain = "monofuel.dev"
#   name   = "www"
#   # TODO automate address with aws provider
#   address = "d3ahrr8xpnvrfs.cloudfront.net."
#   type    = "CNAME"
# }

# resource "namecheap_record" "cf-api-fintool_monofuel-dev" {
#   domain = "monofuel.dev"
#   name   = "api.fintool"
#   # TODO automate address with aws provider
#   address = "devqsfj0s5pnc.cloudfront.net."
#   type    = "CNAME"
# }

# resource "namecheap_record" "cf-www-fintool_monofuel-dev" {
#   domain = "monofuel.dev"
#   name   = "www.fintool"
#   # TODO automate address with aws provider
#   address = "d3hyagl4v28dl.cloudfront.net."
#   type    = "CNAME"
# }



# TODO monofuel.dev mail

# japura.net mail is configured automatically by namecheap for gmail
# NB. old records from linode
# resource "namecheap_record" "mail3-japura-net" {
#   domain  = "japura.net"
#   name    = "ALT1.ASPMX.L.GOOGLE.COM"
#   address = ""
#   type    = "MX"
#   mx_pref = 5
# }
# resource "namecheap_record" "mail2-japura-net" {
#   domain  = "japura.net"
#   name    = "ALT2.ASPMX.L.GOOGLE.COM"
#   address = ""
#   type    = "MX"
#   mx_pref = 5
# }
# resource "namecheap_record" "mail1-japura-net" {
#   domain  = "japura.net"
#   name    = "ASPMX.L.GOOGLE.COM"
#   address = ""
#   type    = "MX"
#   mx_pref = 1
# }
