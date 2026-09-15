data "yandex_compute_image" "image" {
  family = var.image_family
}

resource "yandex_compute_instance" "kittygram_vm" {
  name     = var.vm_name
  hostname = var.vm_name
  zone     = var.yc_zone
  platform_id = var.platform_id

  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      type     = var.disk_type
      image_id = data.yandex_compute_image.image.id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id            = yandex_vpc_subnet.infra_subnet.id
    nat                  = var.vm_nat
    security_group_ids   = [yandex_vpc_security_group.infra_sg.id]
  }

  metadata = {
    serial-port-enable = "1"
    user-data = templatefile("${path.module}/init/cloud-init.yaml",
    {
      SSH_PUBLIC_KEY = var.ssh_public_key
    })
  }
}
