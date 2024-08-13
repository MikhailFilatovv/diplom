###################
#       WEB       #
###################

resource "yandex_compute_instance" "web-1" {
  name                      = "web-01"
  hostname                  = "dpl-s01web"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id     = "${yandex_compute_disk.disk-web-1.id}"
    }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet_web-1.id
	dns_record {
      fqdn = "dpl-s01web.srv."
    ttl = 300
    }
    security_group_ids = [yandex_vpc_security_group.internal.id]
    ip_address         = "10.0.1.3"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "web-2" {
  name                      = "web-02"
  hostname                  = "dpl-s02web"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id     = "${yandex_compute_disk.disk-web-2.id}"
    }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet_web-2.id
	dns_record {
      fqdn = "dpl-s02web.srv."
    ttl = 300
    }
    security_group_ids = [yandex_vpc_security_group.internal.id]
    ip_address         = "10.0.2.3"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

######################
#      bastion       #
######################

resource "yandex_compute_instance" "bastion" {
  name                      = "bastiont"
  hostname                  = "dpl-s01bst"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id     = "${yandex_compute_disk.disk-bastion.id}"
    }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id
	dns_record {
      fqdn = "dpl-s01bst.srv."
    ttl = 300
    }
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-bastion.id]
    ip_address         = "10.0.4.4"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

######################
#       zabbix       #
######################

resource "yandex_compute_instance" "zabbix" {
  name                      = "vm-zabbix"
  hostname                  = "dpl-s01zbx"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id     = "${yandex_compute_disk.disk-zabbix.id}"
    }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id
	dns_record {
      fqdn = "dpl-s01zbx.srv."
    ttl = 300
    }
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-zabbix.id]
    ip_address         = "10.0.4.5"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

#######################
#       elastic       #
#######################

resource "yandex_compute_instance" "elastic" {
  name                      = "vm-elastic"
  hostname                  = "dpl-s01elk"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"

  resources {
    cores  = 2
    memory = 4
    core_fraction = 20
  }

  boot_disk {
    disk_id     = "${yandex_compute_disk.disk-elastic.id}"
    }

  network_interface {
    subnet_id          = yandex_vpc_subnet.private.id
	dns_record {
      fqdn = "dpl-s01elk.srv."
    ttl = 300
    }
    security_group_ids = [yandex_vpc_security_group.internal.id]
    ip_address         = "10.0.3.4"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

#######################
#       kibana        #
#######################

resource "yandex_compute_instance" "kibana" {
  name                      = "vm-kibana"
  hostname                  = "dpl-s02elk"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true
  platform_id               = "standard-v3"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id     = "${yandex_compute_disk.disk-kibana.id}"
    }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id
	dns_record {
      fqdn = "dpl-s02elk.srv."
    ttl = 300
    }
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-kibana.id]
    ip_address         = "10.0.4.3"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
