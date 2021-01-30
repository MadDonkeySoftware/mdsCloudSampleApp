terraform {
  required_providers {
    mdscloud = {
      version = "0.2"
      source = "maddonkeysoftware.com/tf/mdscloud"
    }
  }
  backend "http" {
    address = "http://127.0.0.1:8084/tf/orid:1:mdsCloud:::1001:fs:sample-tf-state"
    lock_address = "http://127.0.0.1:8084/tf/orid:1:mdsCloud:::1001:fs:sample-tf-state"
    unlock_address = "http://127.0.0.1:8084/tf/orid:1:mdsCloud:::1001:fs:sample-tf-state"
    # username="user" # NOTE: use TF_HTTP_USERNAME environment variable
    # password="pwd" # NOTE: use TF_HTTP_PASSWORD environment variable
    # see https://www.terraform.io/docs/backends/types/http.html for more env vars
  }
}

provider "mdscloud" {
  account=var.account
  user_id=var.user_id
  password=var.password
  allow_self_cert=var.allow_self_signed_cert

  sf_url=var.sf_url
  qs_url=var.qs_url
  fs_url=var.fs_url
  sm_url=var.sm_url
  identity_url=var.identity_url
}

# data "mdscloud_list_functions" "all" {}

# data "mdscloud_function" "one" {
#   orid="orid:1:mdsCloud:::1001:sf:06a4ecd0-ce3a-4c9f-8fbb-d26db849df28"
# }


# output "all_functions" {
#   value = data.mdscloud_list_functions.all.functions
# }

# output "function_one" {
#   value = mdscloud_function.sf_one
#   # value = data.mdscloud_function.sf_one.orid
# }

# output "function_test" {
#   value = mdscloud_function.test
# }

#########################################################

resource "mdscloud_queue" "test_queue" {
  name = "testQueue"
}

resource "mdscloud_container" "test" {
  name = "testy"
}

resource "mdscloud_function" "sf_one" {
  name = "testone"
  file_name = "mdsCloudServerlessFunctions-sampleApp.zip"
  runtime = "node"
  entry_point = "src/one:main"
  source_code_hash = filebase64sha256("mdsCloudServerlessFunctions-sampleApp.zip")
}

resource "mdscloud_function" "sf_two" {
  name = "testtwo"
  file_name = "mdsCloudServerlessFunctions-sampleApp.zip"
  runtime = "node"
  entry_point = "src/two:main"
  source_code_hash = filebase64sha256("mdsCloudServerlessFunctions-sampleApp.zip")
}

resource "mdscloud_function" "sf_three" {
  name = "testthree"
  file_name = "mdsCloudServerlessFunctions-sampleApp.zip"
  runtime = "node"
  entry_point = "src/three:main"
  source_code_hash = filebase64sha256("mdsCloudServerlessFunctions-sampleApp.zip")
}

data "template_file" "test_state_machine_definition" {
  template = file("${path.module}/sample-state-machine.json")
  vars = {
    sf_one_orid   = mdscloud_function.sf_one.orid
    sf_two_orid   = mdscloud_function.sf_two.orid
    sf_three_orid = mdscloud_function.sf_three.orid
  }
}

resource "mdscloud_state_machine" "test_sm" {
  definition = data.template_file.test_state_machine_definition.rendered
}
