#create new vpc
resource "google_compute_network" "amgad-vpc" {
  name                    = "amgad-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
