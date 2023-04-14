.PHONY: init-hub, init-iac, init-products, plan-hub, plan-iac, plan-products, apply-hub, apply-iac, apply-products, plan-mg, apply-mg, help
module=DEFAULT
approve=-auto-approve
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]

az-hub:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-iac:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-products:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8

init-hub: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=hub.tfvars
init-iac: az-iac
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/iac/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=iac.tfvars
init-products: az-products
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=products.tfvars

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub: init-hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=hub.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-iac: run terraform plan on the iac workspace. usage: make plan-iac module=<module name>
plan-iac: init-iac
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=iac.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-products: run terraform plan on the products workspace. usage: make plan-products module=<module name>
plan-products: init-products
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=products.tfvars -parallelism=20
	@cd ./speech_app/ && make plan
else
	@terraform plan -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub: init-hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=hub.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-iac: run terraform apply on the iac workspace. usage: make apply-iac module=<module name>
apply-iac: init-iac
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=iac.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-products: run terraform apply on the products workspace. usage: make apply-products module=<module name>
apply-products: init-products
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=products.tfvars $(approve) -parallelism=20
	@cd ./speech_app/ && make apply
else
	@terraform apply -target=$(module)
endif
    
## plan all env
plan: plan-hub plan-iac plan-products 
## apply all env
apply: apply-hub apply-iac apply-products

destroy-mg:

help: Makefile

	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help