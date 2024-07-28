resource "azurerm_kubernetes_cluster" "aks-cluster" {
    name                = "aks-cluster"
    location            = azurerm_resource_group.djb993rg.location
    resource_group_name = azurerm_resource_group.djb993rg.name
    dns_prefix          = "aks-cluster"
    kubernetes_version  = "1.30.0"

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_B2s"
    }

    # Instead of creating a service principle have the system figure this out.
    identity {
        type = "SystemAssigned"
    }    
}

# Attach the container registry to the cluster.
resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.aks-cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.djb993cr.id
  skip_service_principal_aad_check = true
}
