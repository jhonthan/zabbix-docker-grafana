terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
  }

resource "digitalocean_ssh_key" "docker" {
 name       = "zabbix-docker"
 public_key = file(var.pub_key)
}

resource "digitalocean_droplet" "zabbix-docker" {
  image  = var.image_name
  name   = var.droplet_name
  region = var.region
  size   = var.size
 
  ssh_keys = ["${digitalocean_ssh_key.docker.fingerprint}"]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "45s"
  }
  
    provisioner "local-exec" {
      command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' -e 'private_key=${var.pvt_key}' -v install-docker.yaml"
    }

    # provisioner "file" {
    #   source      = "./script.sh"
    #   destination = "/tmp/script.sh"
    # }

    # provisioner "remote-exec" {
    #   inline = [
    #   "sudo chmod +x /tmp/script.sh",
    #   "sh /tmp/script.sh"
    #   ]
    # }   
}


