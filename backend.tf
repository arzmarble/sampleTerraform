terraform {
  # Backup State in S3 Bucket
  backend "s3" {
    bucket = "thanadol-terraform-test"
    key    = "state/terraform.tfstate"
    region = "us-west-2"
  }
}