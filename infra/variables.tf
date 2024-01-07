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

variable "cluster_name" {
  default = "eks"
}

variable "iam" {
  default = "big"
}