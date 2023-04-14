.PHONY: init-hub, plan-hub, apply-hub, destroy-hub, help
module=DEFAULT
# approve=-auto-approve
##   make apply-<env_name that is mentioned in makefile > -varfile=terraform_eu.tfvars or terraform_wu.tfvars

## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
## set subscription for different different env 
az-hub:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8

init-hub: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/hub/dns_zone/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform.tfvars


## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub: init-hub
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif


## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub: init-hub
	@terraform workspace select hub 
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

destroy-hub: init-hub
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif


help: Makefile 
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help
