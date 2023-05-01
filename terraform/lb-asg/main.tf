terraform {
  backend "s3" {
    bucket         = "terraform-series-s3-backend-nntanh"
    key            = "jenkins-lb-asg-terraform"
    region         = "ap-southeast-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::536426868159:role/Terraform-SeriesS3BackendRole"
    dynamodb_table = "terraform-series-s3-backend"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "lb-asg" {
  source        = "../modules/lb-asg"
  subnets       = ["subnet-032985e267d24e016", "subnet-09190c5b7a232cd39", "subnet-092f01bbfd2aad145"]
  ami_id        = "ami-0adbe835b3365e68a"
  instance_type = "t2.small"
  key_name      = "awslab_asia"
  environment   = "dev"
  vpc_id        = "vpc-02f038124e43cfe8a"
}