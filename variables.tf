# Configure the AWS Provider
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.region}"
}

variable "webpagetest_api_key" { default = "sad43432reHH434dsad" }
variable "region" { default = "eu-west-1" }
variable "user_data" {}
variable "public_key_path" {}
