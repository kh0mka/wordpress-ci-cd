# Generic variables

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "tags_for_resource" {
  description = "A nested map of tags to assign to specific resource types"
  type        = map(map(string))
  default = {
    aws_cloudwatch_log_group = {
      "Description" = "Created using the cloudwatch module by khomenokkg"
    }
  }
}

variable "names" {
  description = "A nested map of tags to assign to specific resource types"
  type        = map(string)
  default = {
    cloudwatch_log_group = "CloudWatch-LogGroup"
    iam_policy           = "Policy-LogGroup"
    iam_role             = "Role-LogGroup"
    instance_profile     = "FlowLogInstanceProfile"
  }
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "resource_policy_json" {
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

variable "trust_policy_json" {
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
