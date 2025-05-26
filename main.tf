terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
  
}

provider "azurerm" {
  subscription_id = "00f215a3-9bd7-4e53-94e6-b9c99b99cdef"
  client_id = "e254896d-c873-44df-a0df-475564126aae"
  client_secret = "QsW8Q~4W0P7T65GY6C4Ttk3vnNrObmHo-gAWOdy7"
  tenant_id = "767cdb85-1bc2-4239-8d8d-8228b4b3cf3d"
  features {
  }
}
#creating my resoure_group
 resource "azurerm_resource_group" "myrg340" {
  name     = "myrg340"
  location = "West Europe"
}
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            ="west Europe"
  resource_group_name ="myrg340"
  depends_on = [ azurerm_resource_group.myrg340 ]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = "myrg340"
  virtual_network_name = "example-vnet"
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [ azurerm_virtual_network.example ]
}
