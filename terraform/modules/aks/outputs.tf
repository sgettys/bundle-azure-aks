output "client_certificate" {
  value = azurerm_kubernetes_cluster.wfe-k8s.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.wfe-k8s.kube_config_raw
}

output "k8s_fqdn" {
  value = azurerm_kubernetes_cluster.wfe-k8s.fqdn
}