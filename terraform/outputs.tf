output "instance_public_ip" {
  value     = aws_eip_association.web-srv-eip.public_ip
  sensitive = true
}

output "credentials_dbhost" {
  value     = aws_db_instance.rds_instance.address
  sensitive = true
}

output "credentials_dbname" {
  value     = local.db_credentials.dbname
  sensitive = true
}

output "credentials_dbusername" {
  value     = local.db_credentials.username
  sensitive = true
}

output "credentials_dbpassword" {
  value     = local.db_credentials.password
  sensitive = true
}
