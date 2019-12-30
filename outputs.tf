output "kms_s3_key_arn" {
  value = "${aws_kms_key.state_s3_key.arn}"
}

output "kms_s3_key_id" {
  value = "${aws_kms_key.state_s3_key.id}"
}

output "infrastructue_state_bucket" {
  value = "${aws_s3_bucket.infrastructure.id}"
}