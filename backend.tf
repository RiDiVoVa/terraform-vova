terraform {
  backend "s3" {
    bucket = "my-bucket-for-test-sandbox"
    key    = "epam/backend/terraform.tfstate"
    region = "us-east-1"
    profile = "vova"
  }
}
