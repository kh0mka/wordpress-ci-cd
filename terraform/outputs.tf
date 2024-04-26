output "rds_hostname" {
  value = aws_db_instance.rds_instance.address
}

output "instance_public_ip" {
  value = aws_eip_association.web-srv-eip.public_ip
}
