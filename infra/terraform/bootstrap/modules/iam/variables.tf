variable "terraform_tfvars_secret_kms_crypto_key" {
  type        = string
  description = "The terraform tfvars secret KMS crypto key."
}

variable "tfstate_bucket_kms_crypto_key" {
  type        = string
  description = "The terraform state bucket KMS crypto key."
}