terraform {
  backend "s3" {
    bucket = "backend_bucket"
    key    = "tfstate"
    region = "us-east-1"
  }
}
