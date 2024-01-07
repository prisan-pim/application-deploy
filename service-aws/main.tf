provider "aws" {
  region = var.region
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_iam_user" "user" {
  name = var.iam_s3
}

resource "aws_iam_access_key" "s3_access_key" {
  user = aws_iam_user.user.name  
}

resource "aws_s3_bucket" "s3_manage" {
  bucket = "${var.name_bucket_name}"
}

resource "aws_sqs_queue" "queue" {
  name = "${var.name_sqs_queue}"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  sqs_managed_sse_enabled = true
}


resource "aws_iam_policy" "policy" {
  name        = "${var.policy_name}"
  description = "Create policy for S3 and SQS access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:CreateBucket",
        "s3:ListBucket",
        "s3:GetBucketLocation",
        "sqs:CreateQueue",
        "sqs:GetQueueUrl"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::${var.name_bucket_name}/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "sqs:SendMessage",
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage"
        ],
      "Resource": "${aws_sqs_queue.queue.arn}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "arn:aws:iam::${aws_iam_user.user.arn}:root" }
      }
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "example_attachment" {
  policy_arn = aws_iam_policy.policy.arn
  user       = aws_iam_user.user.name
}