# TODO moving from helm to terraform for home cluster config
.PHONY: update
update:
	helm upgrade -i mgmt ./mgmt
	helm upgrade -i media ./media

# separate update-dev target, to avoid updating dev if running from dev
.PHONY: update-dev
update-dev:
	helm upgrade -i dev ./dev

.PHONY: setup
setup:
	ansible-galaxy install -r requirements.yml

.PHONY: check
check:
	ansible-playbook --syntax-check $(wildcard playbooks/*.yml)

