resource "google_storage_bucket" "no-public-access" {
  name          = "ashish-hedaul-terraform-2026-12345""
  location      = "US"
  force_destroy = true
  public_access_prevention = "enforced"
  project = "eighth-motif-502013-f6"           
}
