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
  create_network         = true
  network_name           = "runner-network-dind"
  subnet_name            = "runner-subnet-dind"
  cluster_suffix         = "dind"
  gh_app_id              = var.gh_app_id
  gh_app_installation_id = var.gh_app_installation_id
  gh_app_private_key     = var.gh_app_private_key
  gh_config_url          = "https://github.com/${var.gh_org_id}"
  arc_container_mode     = "dind"
  enable_private_nodes   = true
}
