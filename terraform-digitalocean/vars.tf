variable "do_token" {}
variable "image_name" {}
variable "droplet_name" {}
variable "region" {}
variable "size" {}
variable "pvt_key" {
  description = "Caminho da chave privada de acesso ssh"
  type        = string
  default     = "~/.ssh/digital_ocean_rsa"
}
variable "pub_key" {
  description = "Caminho da chave privada de acesso ssh"
  type        = string
  default     = "~/.ssh/digital_ocean_rsa.pub"
}