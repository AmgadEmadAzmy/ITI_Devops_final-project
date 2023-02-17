#create new service account for gke 
#resource "google_service_account" "project-service-account" {
#  account_id = "project-service-account"
#  project = "ace-tracker-375011"
#}

#grant permissions for service account
#resource "google_project_iam_binding" "project-service-account-iam" {
 # project = "ace-tracker-375011"
  #role    = "roles/storage.admin"
 # members = [
 #   "serviceAccount:${google_service_account.project-service-account.email}"
 # ]
#}
