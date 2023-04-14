.PHONY: init-iac, init-root, init-hub, init-speech-application, plan-iac, plan-root plan-hub, plan-speech-application, apply-iac, apply-root, apply-root, apply-speech-application, plan-policy, help
module=DEFAULT

##
## init: run terraform init. usage: make init-{env} [ env = init-iac / init-root ]
az-iac:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-root:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-hub:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-speech-application:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8

init-iac: az-iac
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="policy/iac/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=iac.tfvars
init-root: az-root
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="policy/root/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=root.tfvars
init-hub: az-hub
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="policy/hub/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=hub.tfvars	
init-speech-application: az-speech-application
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="policy/speech-application/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=speech_application.tfvars

## plan-iac: run terraform plan on the staging workspace. usage: make plan-iac module=<module name>
plan-iac: init-iac
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=iac.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-root: run terraform plan on the root workspace. usage: make plan-root module=<module name>
plan-root: init-root
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=root.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-hub: run terraform plan on the hub workspace. usage: make plan-hub module=<module name>
plan-hub: init-hub
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=hub.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-speech-application: run terraform plan on the speech-application workspace. usage: make plan-speech-application module=<module name>
plan-speech-application: init-speech-application
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=speech_application.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-iac: run terraform apply on the iac workspace. usage: make apply-iac module=<module name>
apply-iac: init-iac
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=iac.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-root: run terraform apply on the root workspace. usage: make apply-root module=<module name>
apply-root: init-root
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=root.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-hub: run terraform apply on the hub workspace. usage: make apply-hub module=<module name>
apply-hub: init-hub
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=hub.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-speech-application: run terraform apply on the speech-application workspace. usage: make apply-speech-application module=<module name>
apply-speech-application: init-speech-application
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=speech_application.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif
## plan whole variables

plan: plan-iac plan-root plan-hub plan-speech-application 
##

apply: apply-iac apply-root apply-hub apply-speech-application
help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help