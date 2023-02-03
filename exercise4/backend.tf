terraform {
  backend "s3" {
    bucket = "terraform-state-web1"
    key    = "Terraform/backend_excercise"
    region = "us-east-1"
    
  }
}