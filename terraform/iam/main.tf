terraform {
  backend "s3" {
    bucket         = "terraform-series-s3-backend-nntanh"
    key            = "jenkins-iam-terraform"
    region         = "ap-southeast-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::536426868159:role/Terraform-SeriesS3BackendRole"
    dynamodb_table = "terraform-series-s3-backend"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "jenkins_iam" {
  source                = "../modules/iam"
  instance_profile_name = "jenkins-instance-profile"
  iam_policy_name       = "jenkins-iam-policy"
  role_name             = "jenkins-role"
}