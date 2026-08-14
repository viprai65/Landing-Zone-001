resource_group = {
  rg1 = {
    name     = "insider_rg1"
    location = "central india"
  }
}

storage_account = {
  stg1 = {
    name                     = "insiderstt2"
    resource_group_name      = "insider_rg1"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

containers = {
  container1 = {
    name                  = "container1"
    storage_account_name  = "insiderstt2"
    resource_group_name   = "insider_rg1"
    container_access_type = "private"
  }
}

virtual_network = {
  vnet1 = {
    name                = "insider_vnet1"
    resource_group_name = "insider_rg1"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "insider_rg1"
    virtual_network_name = "insider_vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet3 = {
    name                 = "backend-subnet"
    resource_group_name  = "insider_rg1"
    virtual_network_name = "insider_vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "insider_rg1"
    virtual_network_name = "insider_vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

public_ip = {
  pips1 = {
    name                = "bastian_ip"
    resource_group_name = "insider_rg1"
    location            = "central india"
    allocation_method   = "Static"
  }
}

network_interface = {
  nic1 = {
    name                = "frontend_nic"
    location            = "central india"
    resource_group_name = "insider_rg1"

    ip_name                       = "internal"
    subnet_name                   = "frontend-subnet"
    virtual_network_name          = "insider_vnet1"
    private_ip_address_allocation = "Dynamic"
  }
  nic2 = {
    name                = "backend_nic"
    location            = "central india"
    resource_group_name = "insider_rg1"

    ip_name                       = "internal"
    subnet_name                   = "backend-subnet"
    virtual_network_name          = "insider_vnet1"
    private_ip_address_allocation = "Dynamic"
  }
}

network_security_group = {
  nsg1 = {
    name                = "frontend_nsg"
    location            = "central india"
    resource_group_name = "insider_rg1"

    security_rules = {
      allow_ssh = {
        name                       = "allow_ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      allow_http = {
        name                       = "allow_http"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }

  nsg2 = {
    name                = "backend_nsg"
    location            = "central india"
    resource_group_name = "insider_rg1"

    security_rules = {
      allow_ssh = {
        name                       = "allow_ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      allow_http = {
        name                       = "allow_http"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

network_security_group_asso = {
  frontend_nic_nsg_asso = {
    network_interface_name      = "frontend_nic"
    network_security_group_name = "frontend_nsg"
    resource_group_name         = "insider_rg1"
  }
  backend_nic_nsg_asso = {
    network_interface_name      = "backend_nic"
    network_security_group_name = "backend_nsg"
    resource_group_name         = "insider_rg1"
  }
}

linux_virtual_machine = {
  frontend_vm1 = {
    name                = "frontend-vm"
    resource_group_name = "insider_rg1"
    location            = "central india"
    size                = "Standard_DC1ds_v3"

    admin_username                  = "admin123"
    admin_password                  = "Admin@123456"
    disable_password_authentication = false

    network_interface_name = "frontend_nic"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
  backend_vm1 = {
    name                = "backen-vm"
    resource_group_name = "insider_rg1"
    location            = "central india"
    size                = "Standard_DC1ds_v3"

    admin_username                  = "admin123"
    admin_password                  = "Admin@123456"
    disable_password_authentication = false

    network_interface_name = "backend_nic"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

bastians = {
  Bastian = {
    name                = "Bastian-insider"
    location            = "central india"
    resource_group_name = "insider_rg1"

    ip_name              = "Bastian-IP"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "insider_vnet1"
    public_ip_name       = "bastian_ip"
  }
}
