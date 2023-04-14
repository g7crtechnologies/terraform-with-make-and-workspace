# **247-Azure Landing zone**

This repository is the collection of all the base components required for landing zone for 247.ai's Azure Cloud InfrastructureAll modules are based on Terraform   workspace and Makefile.
       Required tools :
       
       -    Az-cli
       -    Makefile
       -    Terraform
       
These tools should be installed to run this project.
for initiate the deployment we need AZ-cli to login to the azure portal need to setup some components for landing zone 
All the tfstate of resource group and other modules will store in  storage account as a backend configuration that is configured in Makefile for each environment.   All the Storage account we need to setup from portal only in each subscription. the backend of all modules is going to be stored in "tfsstrg<environment>tfstate" for each environment there is a separate storage account in different different subscription.  

## **Truth module**

this module is using in all modules to fetch the required data from other module. here it's calling the terraform remotestate and outputs from resource group and vnet as a referece for other module 

## **Terraform Workspace**
We are using terraform workspace for different environments so it will not create a single tfstate file and no need re-write the code for different environments
       These are the modules that are using workspaces :
       
       -    Resource group
       -    Virtual network
       -    Load balancer
       
Workspaces need to be created before running the makefile commands for the below module’s workspace name should be same as these names { dev, psr, qa, stg, stb, prod, hub}
       Commands for workspaces
       
       -    Terraform workspace new <workspace _name>       - to create workspace
       -    Terraform workspace list                        - to list all the workspaces
       -    Terraform workspace destroy <workspace _name>   -to delete the workspace

## **Makefile**
Each module is using makefile. All the backend configuration and terraform related commands are configure in it all the makefile commands are given below The Flow to deploy the landing zone.

first, we will create the management_groups in the root directory. 
This module will deploy a hierarchal structure of management groups in root management group or in root tenant for each management group tfstate file will be ###### different (root folder is “mg”)
 commands to run makefile to deploy mg. 
       
       -    “make plan-mg”  to initialize and plan the whole management group hierarchically.
       -    “make apply-mg”  to apply and initialize.

# Management Group
this module will create management group in desired structure for 247.ai for each mg it has different tfvars file it will assign subscription also on which management group you want assign 
    makefile commands
   
    -     "make plan-mg"    to make a plan for all the mangement group 
    -     "make apply-mg"   to deploy the all mangement group
to deploy one by one you can refer makefile for management group

## **Resource Group** 
This is the root module for all other modules. This will create resource group in all subscription in both eastus and westus location. followed by these commands. 
Environments – {dev, prod, psr, hub, qa, stg, stb}
###### eu – for eastus
       -	“Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform
###### wu – for westus
       -	“Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-wu”  to plan the terraform 
       -	“make apply-< Environments >-wu” to apply the terraform 

## **Virtual network**
This module creates the virtual network for each environment along with nsg’ s , route tables
And subnets 
       
       -    “Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform 

## **Load balancer**
This will deploy load balancer for each vnet in different subscription 
       
       -	“Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform 
       
Commands are same for westus region  “eu” replaced by “wu”

## **Firewall**
The firewall module will create firewall in hub subscription in both region
###### Make file command for firewall (eastus)
       -	“Az-fw-eu” to set the subscription. 
       -	“make plan-fw-eu”  to plan the terraform 
       -	“make apply-fw-eu” to apply the terraform 
###### Make file command for firewall (westus)
       -	“Az-fw-wu” to set the subscription. 
       -	“make plan-fw-wu”  to plan the terraform 
       -	“make apply-fw-wu” to apply the terraform 

## **Azure policy**
This module will apply all the policies on the management groups
###### For iac mg 
       -	“make plan-iac”  to plan the terraform 
       -	“make apply-iac” to apply the terraform 
###### For root mg
       -	“make plan-root”  to plan the terraform 
       -	“make apply-root” to apply the terraform 
###### For hub mg
       -	“make plan-hub”  to plan the terraform 
       -	“make apply-hub” to apply the terraform 
###### For speech-application mg
       -	“make plan-speech-application”  to plan the terraform 
       -	“make apply-speech-application” to apply the terraform 
###### To apply all at once 
       -	“make plan-policy”  to plan the terraform to all mg
       -	“make apply-policy” to apply the terraform to all mg

## **Peering**
This module will peer all the vnets with hub vnet in both region 
###### commands to execute 
       -    “Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform      

## **Express route**
To create express route and virtual network gateway in both hub subscription 
These are the commands
###### For eastus
       -	“make az-er-eu” to set hub subscription in eastus
       -	“make plan-er-eu”  to plan the terraform 
       -	“make apply-er-eu” to apply the terraform 
###### For westus 
       -	“make az-er-wu” to set hub subscription in westus
       -	“make plan-er-wu”  to plan the terraform 
       -	“make apply-er-wu” to apply the terraform 
