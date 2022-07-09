# zabbix-docker-grafana-discord

## 💡 Idea
In this lab, the focus is to create an automation for creating the structure of Zabbix and Grafana for monitoring resources and the access can be used the URL using the Route 53 for create DNS and using the Digital Ocean for provider. 📊

---

### 🛠️ Build with
* Terraform
* Docker
* Ansible
* Docker
* Docker Compose

---

### 🧾 Prerequisites

- Terraform CLI;
- Docker;
- Docker Compose;
- Key (API) for access the Digital Ocean;

---

### ✈️ Process

1. It`s necessary create the file ```terraform.tfvrs``` with the variables for Terraform in the folder ```terraform-digitalocean``` with:

- do_token="Your Token in Digital Ocean"
- image_name="ubuntu-22-04-x64"
- droplet_name="Your Droplet Name"
- region="nyc1"
- size="s-1vcpu-1gb"

2. Inside of the ```files/zabbix``` it`s necessary create the file ```.env``` with the enviroments:

- MARIADB_ROOT_PASSWORD='Your Password'
- MARIADB_DATABASE='zabbix'
- MARIADB_USER='zabbix'
- MARIADB_PASSWORD='huYour Password'


- DB_SERVER_HOST='mysql'
- MYSQL_DATABASE='zabbix'
- MYSQL_USER='zabbix'
- MYSQL_PASSWORD='Your Password'
- PHP_TZ='America/Sao_Paulo'

3. After the configuration of the tools, run the command ```terraform apply``` in the directory 'terraform-digitalocean' of the project. It's necessary to say "Yes" to accept the changes in the provider.

4. The process will be complete in 6 minutes, and the finish will show the droplet_ip_address = "Your IPv4 address"

5. With this IP is possible to create the DNS in Route 53 in AWS.

### 🤔 Some lab considerations
My main goal with this project/lab was to start from scratch with these tools and start using Docker / Kubernetes / Terraform / GitHub Actions (CI/CD). I'm starting my studies in DevOps, I believe there are more efficient and safer ways to do this process, but keep in mind that it was done by a student with a lot of desire to learn and do.
---
