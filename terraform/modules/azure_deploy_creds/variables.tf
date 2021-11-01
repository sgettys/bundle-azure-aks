# -----------------------------------------------------------------------
# AZURE DEPLOY CREDENTIALS MODULE --- DO NOT NEED TO MODIFY
# -----------------------------------------------------------------------
variable "kv_resource_group_name" {
  description = "The name of the resource group containing the key vault with deployment credential secrets."
}
variable "kv_name" {
  description = "Name of the key vault that contains the deploy credential secrets."
}
variable "kv_client_id_secret_key" {
  description = "The key vault secretkey containing the deployment client ID."
}
variable "kv_client_secret_secret_key" {
  description = "The key vault secretkey containing the deployment client secret."
}
