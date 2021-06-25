terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "rafaelmartinsdescomplicandoterraform"
    key    = "terraform-test.tfstate"
    region = "sa-east-1"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "sa-east-1"
}
