resource "google_storage_bucket" "storagebacket" {
  name          = "ashish-hedaul-terraform-2026-12345"
  location      = "US"
  force_destroy = true
  public_access_prevention = "enforced"
  project = "eighth-motif-502013-f6"           
}

resource "google_storage_bucket" "storagebacketrg" {
  name          = "ashish-terraform-2026-1990"
  location      = "US"
  force_destroy = true
  public_access_prevention = "enforced"
  project = "eighth-motif-502013-f6"           
}
