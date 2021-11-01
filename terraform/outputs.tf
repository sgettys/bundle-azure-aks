output "kubeconfig" {
	sensitive = true
	value = module.aks.kube_config
}

output "k8s_fqdn" {
	value = module.aks.k8s_fqdn
}

output "app_name" {
	value = local.base_name
}