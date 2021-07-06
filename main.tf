module "network" {
    source = "./modules/network"
    rg_name = module.rgroup.rg_name
    location = module.rgroup.location_name
    vnet_name = "Group-9-Assignment1-vnet"
    vnet_add_space= ["10.0.0.0/16"]
    subnet_name = "Group-9-Assignment1-subnet"
    subnet_add_space = ["10.0.1.0/24"]
    nsg_name = "Group-9-Assignment1-nsg"
    tags = local.common_tags
    depends_on =[
      module.rgroup
    ]
}

module "vmlinux" {
    source = "./modules/vmlinux"
    vm_name = "Group-9-Assignment1-linux"
    linux_availability_set = "linux_avs"
    nb_count = 2
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network
    ]
}

module "vmwindows" {
    source = "./modules/vmwindows"
    windows_name = "Group-9-Assignment1-win-vm-1"
    windows_availability_set = "windows_avs"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network
    ]
}

module "rgroup" {
    source = "./modules/rgroup"
    location = "canadacentral"
    rg_name = "group-9-assignment1-rg"
    tags = local.common_tags
}

module "datadisk" {
    source = "./modules/datadisk"
    linux_ids = module.vmlinux.linux_VM_Id
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.vmwindows,
      module.vmlinux
    ]
}

module "loadbalancer" {
    source = "./modules/loadbalancer"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    public_ip_address_ids = module.vmlinux.linux_Public_IP
    tags = local.common_tags
    
}

module "common" {
    source = "./modules/common"
    recovery_service_vault_name = "group-9-assignment1-vault"
    log_analytics_workspace_name = "group-9-assignmnet1-loganalytics-workspace"
    storage_account_name = "group-9-assignment1-storage_acc"
    storage_container_name = "group-9-assignment1-storage_container"
    storage_blob_name = "group-9-assignment1-blob"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    
}

module "database" {
    source = "./modules/database"
    db_server_name = "group-9-assignment1-postgre_server"
    db_name = "group-9-assignment1-postgre_server_db"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    
}