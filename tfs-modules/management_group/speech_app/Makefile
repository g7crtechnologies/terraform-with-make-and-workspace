.PHONY: init-speech-application, plan-speech-application, apply-speech-application, plan-mg, help
module=DEFAULT
approve=-auto-approve
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]

az-speech-application:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8

init-speech-application: az-speech-application
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/speech-application/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=speech_application.tfvars

## plan-speech-application: run terraform plan on the speech-application workspace. usage: make plan-speech-application module=<module name>
plan-speech-application: init-speech-application
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=speech_application.tfvars -parallelism=20
	@cd ./env/ && make plan
else
	@terraform plan -target=$(module)
endif

## apply-speech-application: run terraform apply on the speech-application workspace. usage: make apply-speech-application module=<module name>
apply-speech-application: init-speech-application
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=speech_application.tfvars $(approve) -parallelism=20
	@cd ./env/ && make apply
else
	@terraform apply -target=$(module)
endif
## plan whole variables
plan: plan-speech-application 
##
apply: apply-speech-application
help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help