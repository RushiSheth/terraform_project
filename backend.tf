terraform {
    backend "azurerm"{
        resource_group_name = "tfstateRG"
        storage_account_name = "tfstatelab7557"
        container_name = "tfstatefiles"
        key = "pDMRbsfb/pBKaKwjf+HgF5gFQl6rSdcTltJ6F4g7O1ExMuD/y73WFZNkiNhutTchMgFQlFFQFT4CInysZSbmgg=="
    }
}