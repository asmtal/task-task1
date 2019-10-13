variable "region" {
  default = "eu-west-1"
}

variable "profile" {
  default = "devop03"
}


variable "managed_by" {
  default     = "terraform"
  description = "terraform"
}

variable "app_name" {
  default     = "jweather"
  description = "Name of the application"
}

variable "environment" {
  default     = "dev"
  description = "Name of the environment. e.g. prod, qa, dev"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/22"
}

variable "az_count" {
  description = "Number of availability zones to use"
  default     = 2
}

variable "repository_name" {
  default     = "jweather"
  description = "Name for Docker repo"
}
// SNS Variables
variable "sns_ecs_topic" {
  default    =  "ecs_sink"
}
variable "alarms_email" {
  default     = "shegoj@yahoo.com"
  description = "SNS Email Sink"
}

variable "resource_high_threshold" {
  default     = "70"  
  description = "The maximum percentage of Resource  utilization average."
}

variable "resource_low_threshold" {
  default     = "10"  
  description = "The minimum percentage of Resource  utilization average."
}
variable "running_tasks_threshold" {
  type        = "string"
  description = "Period to evaluate alarm."
  default     = "2"
}

variable "resource_utilization_period" {
  type        = "string"
  description = "Period to evaluate alarm."
  default     = "180"
}


