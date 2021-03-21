
update:
	helm upgrade -i mgmt ./mgmt
	helm upgrade -i media ./media

# separate update-dev target, to avoid updating dev if running from dev
update-dev:
	helm upgrade -i dev ./dev