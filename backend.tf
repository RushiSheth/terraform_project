terraform {
    backend "azurerm"{
        resource_group_name = "tfstateRG"
        storage_account_name = "tfstatelab7557"
        container_name = "tfstatefiles"
        key = "lN1XHg9ZHyShhcaWM31ID2o6VzvDSOJws49MmWLN3IaFaDuvhddkJW3a13T01G1eCx3fOYzW/3qF/OgctSlhpw=="
    }
}