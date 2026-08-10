module "resource_groups" {
  source = "../Child module/1-Azurerm_Resource_Group"
  rgs    = var.resource_group
}

module "storage_accounts" {
  source     = "../Child module/2-Azurerm_Storage_Account"
  depends_on = [module.resource_groups]
  stg        = var.storage_account
}

module "container" {
  source     = "../Child module/3-Azurerm_Containers"
  depends_on = [module.storage_accounts]
  container  = var.containers
}

module "virtual_network" {
  source     = "../Child module/4-Azurerm_Virtual_Network"
  depends_on = [module.resource_groups]
  vnets      = var.virtual_network
}

module "subnet" {
  source     = "../Child module/5-Azurerm_Subnet"
  depends_on = [module.virtual_network]
  subnet     = var.subnets
}

module "public_ip" {
  source     = "../Child module/6-Azurerm_public_IP"
  depends_on = [module.resource_groups]
  pips       = var.public_ip
}

module "netwotk_interface" {
  source     = "../Child module/7-Azurern_Network_Interface_Card"
  depends_on = [module.subnet]
  nics       = var.network_interface
}

module "network_securuty_group" {
  source     = "../Child module/8-Azurerm_Network_Security_Group"
  depends_on = [module.netwotk_interface]
  nsgs       = var.network_securuty_group
}

module "network_security_group_asso" {
  source     = "../Child module/9-Azurerm_NSG_NIC_Association"
  depends_on = [module.network_securuty_group]
  nsgasso    = var.network_security_group_asso
}

module "linux_virtual_machine" {
  source     = "../Child module/10-Azurerm_Virtual_Machine"
  depends_on = [module.network_security_group_asso]
  vms        = var.linux_virtual_machine
}

module "Bastian" {
  source     = "../Child module/11-Azurerm_Bastian"
  depends_on = [module.subnet]
  bastian    = var.bastians
}