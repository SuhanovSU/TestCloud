terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
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
      image_id = "fd8v0s6adqu3ui3rsuap" # ОС (Ubuntu, 22.04 LTS)
    }
  }

  network_interface {
    subnet_id = "e9bdgo95ucmut6r7pioq" # одна из дефолтных подсетей
    nat = true # автоматически установить динамический ip
  }
}
