location = "eastus"
tags = {
  environment        = "dev"
  finance_allocation = "finance_allocation"
  project_owner      = "speech"
  product            = "speech"
  product_component  = "telapp"
  network_segment    = "cde"
  type_of_appliance  = "web"
  risk_zone          = "zone1"
  appliance_owner    = "networking"
}

env = {
  stb = {
    stb = {
      name                     = "tfsstgstbactivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
  stg = {
    stg = {
      name                     = "tfsstgstgactivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
  dev = {
    dev = {
      name                     = "tfsstgdevactivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    },
    tfsspeechdeveast = {
      name                     = "tfsspeechdeveast"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    },
  }
  qa = {
    qa = {
      name                     = "tfsstgqaactivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
  prod = {
    prod = {
      name                     = "tfsstgprodactivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
  psr = {
    psr = {
      name                     = "tfsstgpsractivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
  hub = {
    hub = {
      name                     = "tfsstghubactivitylogs"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }

}

containers = {
  stg = {
    stg = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "stg"
    },
    stg2 = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "stg"
    }
  }
  dev = {
    dev = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "dev"
    }

  }
  qa = {
    qa = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "qa"
    }
  }
  prod = {
    prod = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "prod"
    }
  }
  psr = {
    psr = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "psr"
    }
  }
  hub = {
    hub = {
      container_access_type = "blob"
      container_name        = "activateme"
      storage_key           = "hub"
    }
  }
}

subnet_id  = ""
enable_fs  = false
enable_pe  = true
enable_con = true
subnet_ids = [""]

fileshare = {
  dev = {
    telapputterances = {
      name        = "telapputterances"
      quota       = "100"
      storage_key = "tfsspeechdeveast"
    },
    wcrdecrypt = {
      name        = "wcrdecrypt"
      quota       = "100"
      storage_key = "tfsspeechdeveast"
    },
    contentaudio = {
      name        = "contentaudio"
      quota       = "50"
      storage_key = "tfsspeechdeveast"
    },
    contentstatic = {
      name        = "contentstatic"
      quota       = "50"
      storage_key = "tfsspeechdeveast"
    },
    audiodarbot = {
      name        = "audiodarbot"
      quota       = "50"
      storage_key = "tfsspeechdeveast"
    },
    vcontentprivate = {
      name        = "vcontentprivate"
      quota       = "50"
      storage_key = "tfsspeechdeveast"
    },
    contentfeeds = {
      name        = "contentfeeds"
      quota       = "50"
      storage_key = "tfsspeechdeveast"
    },
    contentemdata = {
      name        = "contentemdata"
      quota       = "50"
      storage_key = "tfsspeechdeveast"
    },
  }
}
