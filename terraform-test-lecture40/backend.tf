terraform {
  backend "s3" {
    #bucketはterraform init -backend-config bucket = "バケット名"で指定します。
    key    = "terraform-test-lecture40/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
