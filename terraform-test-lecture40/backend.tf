terraform {
  backend "s3" {
    bucket = "awsstudy-s3-backet-shoichi"
    key    = "terraform-test-lecture40/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
