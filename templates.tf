data "template_file" "bucket_infrastructure" {
    template = "${file("${path.module}/templates/bucket-policy.json")}"

    vars {
      bucket  = "${format("%s-infrastructure", var.stack_name)}"
    }
}