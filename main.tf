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
    recovery_vault_name = module.common.recovery_vault_name
    backup_policy_id = module.common.backup_policy_id
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network,
      module.common
    ]
}

module "vmwindows" {
    source = "./modules/vmwindows"
    windows_name = "Group-9-Assign1-win"
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
    location = "canadacentral"
    rg_name = "group-9-assignment1-rg"
    linux_datadisk1_name = "group-9-assignment1-datadisk1-linux"
    linux_datadisk2_name = "group-9-assignment1-datadisk2-linux"
    win_datadisk3_name = "group-9-assignment1-datadisk3-win"
    linux_vm1_id = module.vmlinux.linux_vm1_id
    linux_vm2_id = module.vmlinux.linux_vm2_id
    windows_id = module.vmwindows.Windows_VM_Id
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.vmwindows,
      module.vmlinux
    ]
}

module "loadbalancer" {
    source = "./modules/loadbalancer"
    lb_name = "group-9-assignment1-lb"
    public_ip_lb_name = "group-9-assignment1-publicip-lb"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    nic_id_1 = module.vmlinux.nic_id_1
    nic_id_2 = module.vmlinux.nic_id_2
    ipconfig1 = module.vmlinux.ipconfig1
    ipconfig2 = module.vmlinux.ipconfig2
    tags = local.common_tags
    depends_on = [
        module.rgroup,
        module.vmlinux
    ]
    
}

module "common" {
    source = "./modules/common"
    recovery_service_vault_name = "group-9-assignment1-vault"
    log_analytics_workspace_name = "group-9-assignmnent1-loganalytics-workspace"
    storage_account_name = "group9assign1stoac"
    storage_container_name = "group9assign1con"
    storage_blob_name = "group9assign1blob"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    depends_on = [
        module.rgroup,
        module.vmlinux
    ]
    
}

module "database" {
    source = "./modules/database"
    db_server_name = "group-9-assignment1-postgre-server"
    db_name = "group-9-assignment1-postgre_server-db"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    depends_on = [
        module.rgroup
    ]
    
}