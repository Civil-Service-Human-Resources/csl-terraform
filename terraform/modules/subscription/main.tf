data "external" "subscription_id" {
  program = ["bash", "${path.module}/get_subscription_id.sh", var.subscription_name]
}

output "subscription_id" {
  value = data.external.subscription_id.result.sub_id
}
