terraform {
    backend "azurerm"{
        resource_group_name = "tfstateRG"
        storage_account_name = "tfstatelab7557"
        container_name = "tfstatefiles"
        key = "BXYfcG7WByWuCJDanT5TyW4scL6gKOhgqDp2ft5ZC0BORxu3Z+wSB/sBqdf393Kp9gapV7Be9cBAcAtPiA8p8g=="
    }
}