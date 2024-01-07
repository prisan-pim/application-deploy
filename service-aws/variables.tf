variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}


variable "access_key" {
  description = "Input Access Key for AWS"
}
variable "secret_key" {
  description = "Input Secrct Key for AWS"
}

variable "policy_name" {
  default = "manage_policy"
}
variable "iam_s3" {
  default = "key-manage"
}

variable "name_sqs_queue" {
  default = "lms-import-data"
}

variable "name_bucket_name" {
  default = "my-web-assets"
}