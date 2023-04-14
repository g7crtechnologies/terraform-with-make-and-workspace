policy = {
  #custom
  # "1" = {
  #   name                 = "Need to audit VMs with CrowdStrike agent install"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
  #   display_name         = ""
  #   description          = ""
  # }
  #custom
  # "2" = {
  #   name                 = "Need to audit VMs with Tanium agent install"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
  #   display_name         = ""
  #   description          = ""
  # }
  "RBAC Roles Audit" = {
    name                 = "RBAC Roles Audit"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a451c1ef-c6ca-483d-87ed-f49761e3ffb5"
    display_name         = "Audit usage of custom RBAC rules"
    description          = "Audit built-in roles such as 'Owner, Contributer, Reader' instead of custom RBAC roles, which are error prone. Using custom roles is treated as an exception and requires a rigorous review and threat modeling"
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Azure DDoS enable" = {
    name                 = "Azure DDoS enable"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a7aca53f-2ed4-4466-a25e-0b45ade68efd"
    display_name         = "Azure DDoS Protection Standard should be enabled"
    description          = "DDoS protection standard should be enabled for all virtual networks with a subnet that is part of an application gateway with a public IP."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Subnets NSG Association" = {
    name                 = "Subnets NSG Association"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
    display_name         = "Subnets should be associated with a Network Security Group"
    description          = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Internet VMS NSG" = {
    name                 = "Internet VMS NSG"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c"
    display_name         = "Internet-facing virtual machines should be protected with network security groups"
    description          = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc"
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "No Public IPS for NIC" = {
    name                 = "No Public IPS for NIC"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114"
    display_name         = "Network interfaces should not have public IPs"
    description          = "This policy denies the network interfaces which are configured with any public IP. Public IP addresses allow internet resources to communicate inbound to Azure resources, and Azure resources to communicate outbound to the internet. This should be reviewed by the network security team."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Azure Monitor log" = {
    name                 = "Azure Monitor log"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/41388f1c-2db0-4c25-95b2-35d7f5ccbfa9"
    display_name         = "Azure Monitor should collect activity logs from all regions"
    description          = "This policy audits the Azure Monitor log profile which does not export activities from all Azure supported regions including global."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "subscription have log" = {
    name                 = "subscription have log"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7796937f-307b-4598-941c-67d3a05ebfe7"
    display_name         = "Azure subscriptions should have a log profile for Activity Log"
    description          = "This policy ensures if a log profile is enabled for exporting activity logs. It audits if there is no log profile created to export the logs either to a storage account or to an event hub."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Alert notification" = {
    name                 = "Alert notification"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6e2593d9-add6-4083-9c9b-4b7d2188c899"
    display_name         = "Email notification for high severity alerts should be enabled"
    description          = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Subscriptions email" = {
    name                 = "Subscriptions email"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f4f78b8-e367-4b10-a341-d9a4ad5cf1c7"
    display_name         = "Subscriptions should have a contact email address for security issues"
    description          = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Restricted port on NSG" = {
    name                 = "Restricted port on NSG"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6"
    display_name         = "All network ports should be restricted on network security groups associated to your virtual machine"
    description          = "Azure Security Center has identified some of your network security groups' inbound rules to be too permissive. Inbound rules should not allow access from 'Any' or 'Internet' ranges. This can potentially enable attackers to target your resources."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Allowed locations" = {
    name                 = "Allowed locations"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
    display_name         = "Allowed locations"
    description          = "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region."
    list                 = true
    type                 = "listOfAllowedLocations"
    parameters = {
      "value" : ["eastus", "westus"]
    }
  }
  "Allowed location rg" = {
    name                 = "Allowed location rg"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
    display_name         = "Allowed locations for resource groups"
    description          = "This policy enables you to restrict the locations your organization can create resource groups in. Use to enforce your geo-compliance requirements."
    list                 = true
    type                 = "listOfAllowedLocations"
    parameters = {
      "value" : ["eastus", "westus"]
    }
  }
  "Remove write permission" = {
    name                 = "Remove write permission"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
    display_name         = "External accounts with write permissions should be removed from your subscription"
    description          = "External accounts with write privileges should be removed from your subscription in order to prevent unmonitored access."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Storage with pvt" = {
    name                 = "Storage with pvt"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6edd7eda-6dd8-40f7-810d-67160c639cd9"
    display_name         = "Storage accounts should use private link"
    description          = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced. Learn more about private links at - https://aka.ms/azureprivatelinkoverview"
    list                 = false
    type                 = ""
    parameters           = {}
  }
  # "Storage with private" = {
  #   name                 = "Storage with private"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9f766f00-8d11-464e-80e1-4091d7874074"
  #   display_name         = "Configure Storage account to use a private link connection"
  #   description          = "Private endpoints connect your virtual network to Azure services without a public IP address at the source or destination. By mapping private endpoints to your storage account, you can reduce data leakage risks. Learn more about private links at - https://aka.ms/azureprivatelinkoverview"
  #   list                 = true
  #   type                 = "privateEndpointSubnetId"
  #   parameters           = {}
  # }
  # "Manage disk encryption" = {
  #   name                 = "Manage disk encryption"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d461a302-a187-421a-89ac-84acdb4edc04"
  #   display_name         = "Managed disks should use a specific set of disk encryption sets for the customer-managed key encryption"
  #   description          = "Requiring a specific set of disk encryption sets to be used with managed disks give you control over the keys used for encryption at rest. You are able to select the allowed encrypted sets and all others are rejected when attached to a disk. Learn more at https://aka.ms/disks-cmk."
  #   list                 = true
  #   type                 = "allowedEncryptionSets"
  #   parameters           = {}
  # }
  "Https for Apps" = {
    name                 = "Https for Apps"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d"
    display_name         = "App Service apps should only be accessible over HTTPS"
    description          = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Vm encrypt temp" = {
    name                 = "Vm encrypt temp"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d"
    display_name         = "Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
    description          = "By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys. Temp disks, data caches and data flowing between compute and storage aren't encrypted. Disregard this recommendation if: 1. using encryption-at-host, or 2. server-side encryption on Managed Disks meets your security requirements. Learn more in: Server-side encryption of Azure Disk Storage: https://aka.ms/disksse, Different disk encryption offerings: https://aka.ms/diskencryptioncomparison"
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Audit diagnostics enable" = {
    name                 = "Audit diagnostics enable"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7f89b1eb-583c-429a-8828-af049802c1d9"
    display_name         = "Audit diagnostic setting for selected resource types"
    description          = "Audit diagnostic setting for selected resource types. Be sure to select only resource types which support diagnostics settings."
    list                 = true
    type                 = "listOfResourceTypes"
    parameters = {
      "value" : ["microsoft.changeanalysis/computechanges", ]
    }
  }
  "Activity log retention" = {
    name                 = "Activity log retention"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b02aacc0-b073-424e-8298-42b22829ee0a"
    display_name         = "Activity log should be retained for at least one year"
    description          = "This policy audits the activity log if the retention is not set for 365 days or forever (retention days set to 0)."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Account logs review" = {
    name                 = "Account logs review"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a830fe9e-08c9-a4fb-420c-6f6bf1702395"
    display_name         = "Review account provisioning logs"
    description          = "CMA_0460 - Review account provisioning logs"
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "Audit VM for DR" = {
    name                 = "Audit VM for DR"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0015ea4d-51ff-4ce3-8d8c-f3f8f0179a56"
    display_name         = "Audit virtual machines without disaster recovery configured"
    description          = "Audit virtual machines which do not have disaster recovery configured. To learn more about disaster recovery, visit https://aka.ms/asr-doc."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "VM Backup Enable" = {
    name                 = "VM Backup Enable"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/013e242c-8828-4970-87b3-ab247555486d"
    display_name         = "Azure Backup should be enabled for Virtual Machines"
    description          = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "RSV with private" = {
    name                 = "RSV with private"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/11e3da8c-1d68-4392-badd-0ff3c43ab5b0"
    display_name         = "[Preview]: Recovery Services vaults should use private link"
    list                 = false
    type                 = ""
    parameters           = {}
    description          = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Recovery Services vaults, data leakage risks are reduced. Learn more about private links for Azure Site Recovery at: https://aka.ms/HybridScenarios-PrivateLink and https://aka.ms/AzureToAzure-PrivateLink."
  }
  "VM SKU Allow" = {
    name                 = "VM SKU Allow"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
    display_name         = "Allowed virtual machine size SKUs"
    description          = "This policy enables you to specify a set of virtual machine size SKUs that your organization can deploy."
    list                 = true
    type                 = "listOfAllowedSKUs"
    parameters = {
      "value" : ["Standard_D2s_v3", "Standard_D4s_v3", ]
    }
  }
  "Storage Restriction" = {
    name                 = "Storage Restriction"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2a1a9cdf-e04d-429a-8416-3bfb72a1b26f"
    display_name         = "Storage accounts should restrict network access using virtual network rules"
    description          = "Protect your storage accounts from potential threats using virtual network rules as a preferred method instead of IP-based filtering. Disabling IP-based filtering prevents public IPs from accessing your storage accounts."
    list                 = false
    type                 = ""
    parameters           = {}
  }
  "JIT for VM ports" = {
    name                 = "JIT for VM ports"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b0f33259-77d7-4c9e-aac6-3aabcfae693c"
    display_name         = "Management ports of virtual machines should be protected with just-in-time network access control"
    description          = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
    list                 = false
    type                 = ""
    parameters           = {}
  }
}
display_name = "mg-iac"

policy_rg = {
  "Require tag on resource" = {
    name                 = "Require tag on resource"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1e30110a-5ceb-460c-a204-c1c3969c6d62"
    display_name         = "Require a tag and its value on resources"
    description          = "Enforces a required tag and its value. Does not apply to resource groups."
    list                 = true
    parameters           = { "value" : "environment" },
    parameters2          = { "value" : "dev" }
    type                 = ""
  }
  "Require a tag on rg" = {
    name                 = "Require a tag on rg"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
    display_name         = "Require a tag and its value on resource group"
    description          = "Enforces a required tag and its value on resource groups."
    list                 = true
    parameters           = { "value" : "environment" },
    parameters2          = { "value" : "dev" }
    type                 = ""
  }
  # "Add tag on resource" = {
  #   name                 = "Add tag on resource"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"
  #   display_name         = "Add a tag to resources"
  #   description          = "Adds the specified tag and value when any resource missing this tag is created or updated. Existing resources can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed. Does not modify tags on resource groups."
  #   list                 = true
  #   parameters           = { "value" : "environment" },
  #   parameters2          = { "value" : "dev" }
  #   type                 = ""
  # }
  # "Tag on subscription" = {
  #   name                 = "Tag on subscription"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96d9a89c-0d67-41fc-899d-2b9599f76a24"
  #   display_name         = "Add a tag to subscriptions"
  #   description          = "Adds the specified tag and value to subscriptions via a remediation task. If the tag exists with a different value it will not be changed. See https://aka.ms/azurepolicyremediation for more information on policy remediation."
  #   list                 = true
  #   parameters           = { "value" : "environment" },
  #   parameters2          = { "value" : "dev" }
  #   type                 = ""
  # }
  # "Inherit a tag" = {
  #   name                 = "Inherit a tag"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/40df99da-1232-49b1-a39a-6da8d878f469"
  #   display_name         = "Inherit a tag from the subscription if missing"
  #   description          = "Adds the specified tag with its value from the containing subscription when any resource missing this tag is created or updated. Existing resources can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed."
  #   list                 = false
  #   parameters           = { "value" : "environment" },
  #   type                 = "tagName"
  #   parameters2          = {}
  # }
  # "Storage deny public" = {
  #   name                 = "Storage deny public"
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a06d0189-92e8-4dba-b0c4-08d7669fce7d"
  #   display_name         = "Configure storage accounts to disable public network access"
  #   description          = "To improve the security of Storage Accounts, ensure that they aren't exposed to the public internet and can only be accessed from a private endpoint. Disable the public network access property as described in https://aka.ms/storageaccountpublicnetworkaccess. This option disables access from any public address space outside the Azure IP range, and denies all logins that match IP or virtual network-based firewall rules. This reduces data leakage risks."
  #   list                 = false
  #   type                 = "effect"
  #   parameters           = { "value" : "Modify" }
  #   parameters2          = {}
  # }
}
