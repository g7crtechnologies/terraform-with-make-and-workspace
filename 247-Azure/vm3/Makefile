.PHONY: init-dev-eu, init-prod-eu, init-hub-eu, init-psr-eu, init-qa-eu, init-stg-eu, init-stb-eu, plan-hub, plan-dev, plan-qa, plan-psr, plan-prod, plan-stg, plan-stb, plan-dev-eu, plan-prod-eu, plan-hub-eu, plan-psr-eu, plan-qa-eu, plan-stg-eu, plan-stb-eu, apply-hub, apply-dev, apply-qa, apply-psr, apply-prod, apply-stg, apply-stb, apply-dev-eu, apply-prod-eu, apply-hub-eu, apply-psr-eu, apply-qa-eu, apply-stg-eu, apply-stb-eu, init-dev-wu, init-prod-wu, init-hub-wu, init-prod-wu, init-hub-wu, init-psr-wu, init-qa-wu, init-stg-wu, init-stb-wu, plan-prod-wu, plan-hub-wu, plan-psr-wu, plan-stg-wu, plan-stb-wu, apply-prod-wu, apply-hub-wu, apply-psr-wu, apply-stg-wu, apply-stb-wu, plan-eu, plan-wu, apply-eu, apply-wu, destroy-psr-eu, destroy-psr-wu, destroy-hub-eu, destroy-hub-wu, destroy-dev-eu, destroy-dev-wu, destroy-qa-eu, destroy-qa-wu, destroy-stg-eu, destroy-stg-wu, destroy-stb-eu, destroy-stb-wu, destroy-prod-eu, destroy-prod-wu, destroy-hub, destroy-dev, destroy-qa, destroy-psr, destroy-prod, destroy-stg, destroy-stb, env, help
module=DEFAULT
# approve=-auto-approve
##   make apply-<env_name that is mentioned in makefile > -varfile=terraform_eu.tfvars or terraform_wu.tfvars

## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
## set subscription for different different env 
az-dev:
	@az account set -s f63b58a1-f8a2-4d25-8dac-4d38aa90a810
az-prod:
	@az account set -s 16d401c3-90cd-466a-a075-27c333d16bce
az-hub:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-psr:
	@az account set -s f55584c8-fc18-47da-bf63-75f4d3951ae3
az-qa:
	@az account set -s b88a3954-17c7-4576-8d74-586ea43d7d2d
az-stg:
	@az account set -s a98702d2-48f7-4aba-9fe6-b568d7487210
az-stb:
	@az account set -s 14d3f616-f754-40e5-a37e-925bfd2e4480

init-dev-eu: az-dev
	@terraform init -backend-config=storage_account_name="tfsstgdevtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/dev/default.tfstate" -backend-config=resource_group_name="tfs-rg-dev-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-prod-eu: az-prod
	@terraform init -backend-config=storage_account_name="tfsstgprodtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/prod/default.tfstate" -backend-config=resource_group_name="tfs-rg-prod-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-hub-eu: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-psr-eu: az-psr
	@terraform init -backend-config=storage_account_name="tfsstgpsrtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/psr/default.tfstate" -backend-config=resource_group_name="tfs-rg-psr-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-qa-eu: az-qa
	@terraform init -backend-config=storage_account_name="tfsstgqatfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/qa/default.tfstate" -backend-config=resource_group_name="tfs-rg-qa-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-stg-eu: az-stg
	@terraform init -backend-config=storage_account_name="tfsstgstgtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/stg/default.tfstate" -backend-config=resource_group_name="tfs-rg-stg-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-stb-eu: az-stb
	@terraform init -backend-config=storage_account_name="tfsstgstbtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/vm3/stb/default.tfstate" -backend-config=resource_group_name="tfs-rg-stb-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars

## plan-dev: run terraform plan on the staging workspace. usage: make plan-dev module=<module name>
plan-dev-eu: init-dev-eu
	@terraform workspace select dev
ifeq (DEFAULT,$(module))

	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod-eu: init-prod-eu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub-eu: init-hub-eu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-psr: run terraform plan on the psr workspace. usage: make plan-psr module=<module name>
plan-psr-eu: init-psr-eu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-qa: run terraform plan on the qa workspace. usage: make plan-qa module=<module name>
plan-qa-eu: init-qa-eu
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg-eu: init-stg-eu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb-eu: init-stb-eu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-dev: run terraform apply on the dev workspace. usage: make apply-dev module=<module name>
apply-dev-eu: init-dev-eu
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod-eu: init-prod-eu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub-eu: init-hub-eu
	@terraform workspace select hub 
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-psr: run terraform apply on the psr workspace. usage: make apply-psr module=<module name>
apply-psr-eu: init-psr-eu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-qa: run terraform apply on the qa workspace. usage: make apply-qa module=<module name>
apply-qa-eu: init-qa-eu
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg-eu: init-stg-eu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb-eu: init-stb-eu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif



### west-us region



init-prod-wu: az-prod
	@terraform init -backend-config=storage_account_name="tfsstgprodtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/vm3/prod/default.tfstate" -backend-config=resource_group_name="tfs-rg-prod-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-hub-wu: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/vm3/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-psr-wu: az-psr
	@terraform init -backend-config=storage_account_name="tfsstgpsrtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/vm3/psr/default.tfstate" -backend-config=resource_group_name="tfs-rg-psr-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-stg-wu: az-stg
	@terraform init -backend-config=storage_account_name="tfsstgstgtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/vm3/stg/default.tfstate" -backend-config=resource_group_name="tfs-rg-stg-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars
init-stb-wu: az-stb
	@terraform init -backend-config=storage_account_name="tfsstgstbtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/vm3/stb/default.tfstate" -backend-config=resource_group_name="tfs-rg-stb-tfstate" -upgrade -reconfigure -var-file=terraform_wu.tfvars

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod-wu: init-prod-wu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-psr: run terraform plan on the psr workspace. usage: make plan-psr module=<module name>
plan-psr-wu: init-psr-wu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg-wu: init-stg-wu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb-wu: init-stb-wu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod-wu: init-prod-wu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub-wu: init-hub-wu
	@terraform workspace select hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-psr: run terraform apply on the psr workspace. usage: make apply-psr module=<module name>
apply-psr-wu: init-psr-wu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg-wu: init-stg-wu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb-wu: init-stb-wu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## Destroy resources
destroy-psr-eu: init-psr-eu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-psr-wu: init-psr-wu
	@terraform workspace select psr
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

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

destroy-dev-eu: init-dev-eu
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-dev-wu: init-dev-wu
	@terraform workspace select dev
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-qa-eu: init-qa-eu
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-qa-wu: init-qa-wu
	@terraform workspace select qa
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-stg-eu: init-stg-eu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-stg-wu: init-stg-wu
	@terraform workspace select stg
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-stb-eu: init-stb-eu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-stb-wu: init-stb-wu
	@terraform workspace select stb
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-prod-eu: init-prod-eu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_eu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif

destroy-prod-wu: init-prod-wu
	@terraform workspace select prod
ifeq (DEFAULT,$(module))
	@terraform destroy -var-file=terraform_wu.tfvars $(approve) -parallelism=20
else
	@terraform destroy -target=$(module)
endif


plan-hub: plan-hub-eu plan-hub-wu
plan-dev: plan-dev-eu
plan-qa: plan-qa-eu
plan-stg: plan-stg-eu plan-stg-wu
plan-stb: plan-stb-eu plan-stb-wu
plan-prod: plan-prod-eu plan-prod-wu
plan-psr: plan-psr-eu plan-psr-wu

apply-hub: apply-hub-eu apply-hub-wu
apply-dev: apply-dev-eu
apply-qa: apply-qa-eu
apply-stg: apply-stg-eu apply-stg-wu
apply-stb: apply-stb-eu apply-stb-wu
apply-prod: apply-prod-eu apply-prod-wu
apply-psr: apply-psr-eu apply-psr-wu

destroy-hub: destroy-hub-eu destroy-hub-wu
destroy-dev: destroy-dev-eu
destroy-qa: destroy-qa-eu
destroy-stg: destroy-stg-eu destroy-stg-wu
destroy-stb: destroy-stb-eu destroy-stb-wu
destroy-prod: destroy-prod-eu destroy-prod-wu
destroy-psr: destroy-psr-eu destroy-psr-wu

##
help: Makefile 
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help
