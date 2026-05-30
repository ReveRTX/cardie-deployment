output "slave-server-public-ip" {
    value = aws_instance.slave-server.public_ip
}