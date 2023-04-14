location = "westus"
tags = {
  "terraform"     = 1
  "environment"   = "dev"
  "project_owner" = "speech"
}
container_access_type = "blob"
env = {
  stb = {
    stb = {
      name                     = "wcrslsaudioprocstb"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprocstb"]
      account_replication_type = "LRS"
    }
  }
  stg = {
    stg = {
      name                     = "wcrslsaudioprocstg"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprocstg"]
      account_replication_type = "LRS"
    }
  }
  dev = {
    dev = {
      name                     = "wcrslsaudioprocdev"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprocdev"]
      account_replication_type = "LRS"
    }
  }
  qa = {
    qa = {
      name                     = "wcrslsaudioprocqa"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprocqa"]
      account_replication_type = "LRS"
    }
  }
  prod = {
    prod = {
      name                     = "wcrslsaudioprocprod"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprocprod"]
      account_replication_type = "LRS"
    }
  }
  psr = {
    psr = {
      name                     = "wcrslsaudioprocpsr"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprocpsr"]
      account_replication_type = "LRS"
    }
  }
  hub = {
    hub = {
      name                     = "wcrslsaudioprochub"
      account_tier             = "Standard"
      file_shares              = ["wcrslsaudioprochub"]
      account_replication_type = "LRS"
    }
  }
}
subnet_id  = ""
enable_fs  = false
enable_pe  = true
enable_con = true
subnet_ids = [""]
fs_quota   = null
containers = {}
fileshare  = {}
