variable "subscription_name" {
  type        = string
  description = "Subscription name"
  default     = "CSL-Staging"

  validation {
    condition     = contains(["CSL-Staging", "CSL-Production"], var.subscription_name)
    error_message = "Subscription name must be CSL-Staging or CSL-Production."
  }

}
