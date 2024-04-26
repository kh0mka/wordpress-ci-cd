resource "aws_cloudwatch_log_group" "log_group" {
  name = lookup(var.names, "cloudwatch_log_group", "unspecified-name")
  tags = merge(var.tags, lookup(var.tags_for_resource, "aws_cloudwatch_log_group", {}))
}

resource "aws_iam_policy" "flow_log_policy" {
  name = lookup(var.names, "iam_policy", "unspecified-name")
  path = "/"

  policy = var.resource_policy_json
}

resource "aws_iam_role" "flow_log_role" {
  name               = lookup(var.names, "iam_role", "unspecified-name")
  assume_role_policy = var.trust_policy_json
}

resource "aws_iam_policy_attachment" "attach_resource_policy_to_role" {
  name       = lookup(var.names, "iam_policy", "unspecified-name")
  policy_arn = aws_iam_policy.flow_log_policy.arn
  roles      = [aws_iam_role.flow_log_role.name]
}

resource "aws_flow_log" "flow_log_parameters" {
  iam_role_arn    = aws_iam_role.flow_log_role.arn
  log_destination = aws_cloudwatch_log_group.log_group.arn
  traffic_type    = "ALL"
  subnet_id       = var.subnet_id
}

resource "aws_iam_instance_profile" "FlowLogInstanceProfile" {
  name = lookup(var.names, "instance_profile", "unspecified-name")
  role = aws_iam_role.flow_log_role.name
}
