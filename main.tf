# Configure the AWS Provider
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.region}"
}


module "config" {
  source="./modules/config"
  key_path="${var.public_key_path}"
}

module "instance" {
  source="./modules/ec2"
  access_key_id="${module.instance_user.id}"
  access_key_secret="${module.instance_user.secret}"
  api_key="${var.webpagetest_api_key}"
  region="${var.region}"
  user_data="${var.user_data}"
}

module "instance_key_pair" {
  source = "./modules/key_pair"
  public_key = "${module.config.public_key}"
}

module "instance_user" {
  source="./modules/user"
}
