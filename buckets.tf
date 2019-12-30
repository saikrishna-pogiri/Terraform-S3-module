resource "aws_s3_bucket" "infrastructure" {
  bucket = "${var.stack_name}-infrastructure"
  acl    = "private"
	region = "${var.region}"

	lifecycle {
    prevent_destroy = true
  }

	versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.state_s3_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

	cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = [""]
    expose_headers  = ["ETag"]
  }

  tags {
    Name    = "${var.stack_name}-infrastructure"
    Owner   = "${var.owners}"
    Role    = "store-state"
  }
}

resource "aws_s3_bucket_policy" "state_infrastructure" {
  bucket = "${aws_s3_bucket.infrastructure.id}"
  policy = "${data.template_file.bucket_infrastructure.rendered}"
}