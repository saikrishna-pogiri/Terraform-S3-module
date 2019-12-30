resource "aws_kms_key" "state_s3_key" {
  description             = "This key is used to encrypt objects in bucket"
  deletion_window_in_days = 10
  enable_key_rotation     = true
	key_usage      = "ENCRYPT_DECRYPT"
  is_enabled     = "true"

  tags {
    Name    = "${var.stack_name}-s3"
    Owner   = "${var.owners}"
    Role    = "encrypt-state-s3"
  }
}

resource "aws_kms_alias" "state_s3_key" {
  name          = "alias/state_s3_key"
  target_key_id = "${aws_kms_key.state_s3_key.key_id}"
}