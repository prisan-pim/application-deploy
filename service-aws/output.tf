output "access_key" {
  sensitive = true
  value = aws_iam_access_key.s3_access_key.id
}

output "secret_key" {
  sensitive = true
  value = aws_iam_access_key.s3_access_key.secret
}

output "bucket_name" {
  value = aws_s3_bucket.s3_manage.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.s3_manage.region
}

output "bucket_domain_name" {
  value = aws_s3_bucket.s3_manage.bucket_domain_name
}

output "queue_url" {
  value = aws_sqs_queue.queue.id
}

output "queue_name" {
  value = aws_sqs_queue.queue.name
}