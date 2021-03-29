provider "namecheap" {
  username  = "monofuel"
  api_user  = "monofuel"
  api_token = var.namecheap_key
}

# NB. disabling these domain resources for now

# Personal blog domain
resource "namecheap_domain" "monofuel-dev" {
  name                 = "monofuel.dev"
  add_free_who_isguard = true
  years                = 2
}

# # Community domain
# # Was for japura.net minecraft, no longer active
resource "namecheap_domain" "japura-net" {
  name                 = "japura.net"
  add_free_who_isguard = true
  years                = 9
}

# # domain for side projects
resource "namecheap_domain" "soggysquad-space" {
  name                 = "soggysquad.space"
  add_free_who_isguard = true
  years                = 4
}

# NB. domain of old project, no longer running
# resource "namecheap_domain" "badmars-net" {
#   name                 = "badmars.net"
#   add_free_who_isguard = true
#   years                = 2
# }
