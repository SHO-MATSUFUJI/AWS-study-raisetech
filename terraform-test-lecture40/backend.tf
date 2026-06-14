terraform {
  backend "s3" {
    bucket = "lecture33-20260505"
    key    = "terraform-lecture33/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
