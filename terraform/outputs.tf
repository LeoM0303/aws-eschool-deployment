output "db_instance_ip" {
  value = aws_instance.db_instance.public_ip
}

output "web_instance_ip" {
  value = aws_instance.web_instance.public_ip
}

output "ssh_web" {
  value = "ssh -i ${path.module}/eschool-key.pem ubuntu@${aws_instance.web_instance.public_ip}"
}

output "ssh_db" {
  value = "ssh -i ${path.module}/eschool-key.pem ubuntu@${aws_instance.db_instance.public_ip}"
}