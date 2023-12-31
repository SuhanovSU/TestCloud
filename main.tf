terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}

provider "yandex" {
  token     = 
  cloud_id  = 
  folder_id = 
  zone      = var.ya_zone
  default_tags {
    tags = var.default_tags
  }
}

provider "routeros" {
  hosturl  = "(https|api|apis)://my.router.local[:port]"
  username = "my_username"
  password = "my_super_secret_password"
}

data "yandex_compute_image" "last_ubuntu" {
  family = "ubuntu-2204-lts"  # ОС (Ubuntu, 22.04 LTS)
}
data "yandex_compute_image" "last_mikrotik" {
  family = "mikrotik"  # needs to be clarified
}
data "yandex_vpc_subnet" "default_a" {
  name = "default-ru-central1-a"  # одна из дефолтных подсетей
}

resource "yandex_compute_instance" "default" { 
  name = "test-instance"
	platform_id = "standard-v1" # тип процессора (Intel Broadwell)
  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores  = 2 # vCPU
    memory = 1 # RAM
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.last_ubuntu.id
    }
  }
  network_interface {
    subnet_id = data.yandex_vpc_subnet.default_a.subnet_id
    nat = true # автоматически установить динамический ip
  }
}

resource "yandex_compute_instance" "default-mk" { 
  name = "test-mikrotik"
	platform_id = "standard-v1" # тип процессора (Intel Broadwell)
  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores  = 2 # vCPU
    memory = 1 # RAM
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.last_mikrotik.id
    }
  }
  network_interface {
    subnet_id = data.yandex_vpc_subnet.default_a.subnet_id
    nat = true # автоматически установить динамический ip
  }
}
