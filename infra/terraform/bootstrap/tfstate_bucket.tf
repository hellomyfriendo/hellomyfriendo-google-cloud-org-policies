resource "random_pet" "tfstate_bucket" {
  length = 4
}

resource "google_storage_bucket" "tfstate" {
  name     = random_pet.tfstate_bucket.id
  location = var.region

  uniform_bucket_level_access = true

  encryption {
    default_kms_key_name = module.kms.tfstate_bucket_kms_crypto_key
  }

  versioning {
    enabled = true
  }

  depends_on = [
    module.iam
  ]
}