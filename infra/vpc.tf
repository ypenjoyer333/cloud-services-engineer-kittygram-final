resource "yandex_vpc_network" "infra_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "infra_subnet" {
  name           = var.subnet_name
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.infra_network.id
  v4_cidr_blocks = ["10.2.19.0/24"]
}

resource "yandex_vpc_security_group" "infra_sg" {
  name      = "${var.vpc_name}-sg"
  network_id = yandex_vpc_network.infra_network.id

  egress {
  	protocol = "ANY"
  	v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  	protocol    = "TCP"
  	port        = "22"
  	v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  	protocol    = "TCP"
  	port        = "80"
  	v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
