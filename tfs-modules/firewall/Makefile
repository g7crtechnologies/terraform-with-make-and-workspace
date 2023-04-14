.PHONY: init-dev-eu, init-prod-eu, init-hub-eu, init-hub-eu, init-qa-eu, init-stg-eu, init-stb-eu, plan-hub, plan-dev, plan-qa, plan-hub, plan-prod, plan-stg, plan-stb, plan-dev-eu, plan-prod-eu, plan-hub-eu, plan-hub-eu, plan-qa-eu, plan-stg-eu, plan-stb-eu, apply-hub, apply-dev, apply-qa, apply-hub, apply-prod, apply-stg, apply-stb, apply-dev-eu, apply-prod-eu, apply-hub-eu, apply-hub-eu, apply-qa-eu, apply-stg-eu, apply-stb-eu, init-dev-wu, init-prod-wu, init-hub-wu, init-prod-wu, init-hub-wu, init-hub-wu, init-qa-wu, init-stg-wu, init-stb-wu, plan-prod-wu, plan-hub-wu, plan-hub-wu, plan-stg-wu, plan-stb-wu, apply-prod-wu, apply-hub-wu, apply-hub-wu, apply-stg-wu, apply-stb-wu, plan-eu, plan-wu, apply-eu, apply-wu, env, help
module=DEFAULT
# approve=-auto-approve
##   make apply-<env_name that is mentioned in makefile > -varfile=terraform_eu.tfvars or terraform_wu.tfvars

## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
## set subscription for different different env 
az-hub:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8

init-hub-eu: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/firewall/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars


## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub-eu: init-hub-eu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub-eu: init-hub-eu
	@terraform workspace select hub 
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif


### west-us region



init-hub-wu: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/firewall/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif


## Destroy hub

destroy-hub-eu: init-hub-eu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

plan: plan-hub-eu plan-hub-wu

apply: apply-hub-eu apply-hub-wu

destroy: destroy-hub-eu destroy-hub-wu

##
help: Makefile 
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help
