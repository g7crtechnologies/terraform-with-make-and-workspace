subscription_id = {
  prod = "16d401c3-90cd-466a-a075-27c333d16bce"
  dev  = "f63b58a1-f8a2-4d25-8dac-4d38aa90a810"
  qa   = "b88a3954-17c7-4576-8d74-586ea43d7d2d"
  psr  = "f55584c8-fc18-47da-bf63-75f4d3951ae3"
  stg  = "a98702d2-48f7-4aba-9fe6-b568d7487210"
  hub  = "fd2d6291-f998-4e73-95d6-12dc7a0a20c8"
}
location = "westus"
custom_roles = {
  "custom_policy" = {
    action = [
      "Microsoft.Compute/virtualMachines/restart/action",
      "Microsoft.Compute/virtualMachines/write",
      "Microsoft.Compute/virtualMachines/start/action",
      "Microsoft.Compute/virtualMachines/poweroff/action",
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.Authorization/roleAssignments/read",
      "Microsoft.Authorization/roleAssignments/write",
      "Microsoft.Support/supportTickets/read",
      "Microsoft.Support/supportTickets/write",
      "Microsoft.Compute/virtualMachines/read",
      "microsoft.network/virtualnetworkgateways/connections/read",
      "Microsoft.Authorization/policyDefinitions/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/subscriptions/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Consumption/usageDetails/read",
      "Microsoft.Resources/subscriptions/providers/read",
      "Microsoft.Resources/subscriptions/providers/read",
    ]
    data_action = [
      "Microsoft.Compute/virtualMachines/loginAsAdmin/action",
    ]
    description = "Allows users to manage compute instances and service accounts"
    name        = "my-policy"
  }
}
