policy = {
  "Max owner sub" = {
    name                 = "Max owner sub"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f11b553-d42e-4e3a-89be-32ca364cad4c"
    display_name         = "A maximum of 3 owners should be designated for your subscription"
    description          = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
  }
  "MFA enable" = {
    name                 = "MFA enable"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9297c21d-2ed6-4474-b48f-163f75654ce3"
    display_name         = "MFA should be enabled for accounts with write permissions on your subscription"
    description          = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
  }
  "Email for alert" = {
    name                 = "Email for alert"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6e2593d9-add6-4083-9c9b-4b7d2188c899"
    display_name         = "Email notification for high severity alerts should be enabled"
    description          = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center."
  }
  "Sub email for sec issue" = {
    name                 = "Sub email for sec issue"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f4f78b8-e367-4b10-a341-d9a4ad5cf1c7"
    display_name         = "Subscriptions should have a contact email address for security issues"
    description          = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center."
  }
  "MFA should enable" = {
    name                 = "MFA should enable"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/aa633080-8b72-40c4-a2d7-d00c03e80bed"
    display_name         = "MFA should be enabled on accounts with owner permissions on your subscription"
    description          = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources."
  }
  "External owner remove" = {
    name                 = "External owner remove"
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f8456c1c-aa66-4dfb-861a-25d127b775c9"
    display_name         = "External accounts with owner permissions should be removed from your subscription"
    description          = "External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access."
  }
  "External write remove" = {
    name                 = "External write remove "
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
    display_name         = "External accounts with write permissions should be removed from your subscription"
    description          = "External accounts with write privileges should be removed from your subscription in order to prevent unmonitored access."
  }
}
display_name = "root"
policy_rg = null