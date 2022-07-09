output "droplet_ip_address" {
  value = digitalocean_droplet.zabbix-docker.ipv4_address
}

output "tf_located_the_file" { 
  value = fileexists("${path.module}/id_rsa") 
}