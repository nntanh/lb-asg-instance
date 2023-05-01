terraform {
  backend "s3" {
    bucket         = "terraform-series-s3-backend-nntanh"
    key            = "jenkins-agent-terraform"
    region         = "ap-southeast-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::536426868159:role/Terraform-SeriesS3BackendRole"
    dynamodb_table = "terraform-series-s3-backend"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name      = "jenkins-agent"
  ami_id             = "ami-08b8da7891589164e"
  instance_type      = "t2.small"
  key_name           = "awslab_asia"
  subnet_ids         = ["subnet-032985e267d24e016", "subnet-09190c5b7a232cd39", "subnet-092f01bbfd2aad145"]
  instance_count     = 1
}
