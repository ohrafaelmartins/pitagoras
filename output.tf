output "dns_name" {
  value = aws_instance.web.public_dns
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
