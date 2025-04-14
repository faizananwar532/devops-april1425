resource "google_storage_bucket" "static-site" {
  name          = var.devops-bucket
  location      = var.region
  force_destroy = true
  storage_class = "REGIONAL"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  lifecycle_rule {
    condition {
      age = 365
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
}