/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "runner-gke" {
  # source  = "terraform-google-modules/github-actions-runners/google//modules/gh-runner-gke"
  # version = "~> 5.0"
  source  = "../../modules/gh-runner-gke"

  project_id             = var.project_id
  region                 = var.region
  ip_range_pods_name     = var.ip_range_pods_name
  ip_range_services_name = var.ip_range_services_name
  network_name           = var.network_name
  subnet_name            = var.subnet_name
  create_network         = var.create_network
  subnetwork_project     = var.subnetwork_project
  max_node_count         = var.max_node_count
  min_node_count         = var.min_node_count
  cluster_suffix         = "dind-rootless"
  gh_app_id              = var.gh_app_id
  gh_app_installation_id = var.gh_app_installation_id
  gh_app_private_key     = var.gh_app_private_key
  gh_config_url          = "https://github.com/${var.gh_org_id}"
  enable_private_nodes   = var.enable_private_nodes
  grant_registry_access  = var.grant_registry_access

  # pass values.yaml for dind-rootless runners configuratin
  arc_runners_values = [
    file("${path.module}/values.yaml")
  ]
}
