source "yandex" "ubuntu-nginx" {
  token               = "AQAAAAAFe4AZAATuwRc9Mc4-dEZMlcpBUtRZZnQ"
  folder_id           = "b1gi0ef173nvmkbvt5h4"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "my custom ubuntu with nginx"
  image_family        = "ubuntu-2004-lts"
  image_name          = "my-ubuntu-nginx"
  subnet_id           = "e2l6n2o9pvm3rf3c2hlj"
  disk_type           = "network-ssd"
  zone                = "ru-central1-a"
}
 
build {
  sources = ["source.yandex.ubuntu-nginx"]
 
  provisioner "shell" {
    inline = ["sudo apt-get update -y",
              "sudo apt-get install -y nginx",
              "sudo systemctl enable nginx.service"]
  }
} 