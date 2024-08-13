resource "yandex_compute_disk" "disk-web-1" {
  name     = "disk-web1"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}

resource "yandex_compute_disk" "disk-web-2" {
  name     = "disk-web2"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}

resource "yandex_compute_disk" "disk-bastion" {
  name     = "disk-bastion"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd8mfcsu31d3139ufj78"
  size     = 8

}

resource "yandex_compute_disk" "disk-zabbix" {
  name     = "disk-zabbix"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}

resource "yandex_compute_disk" "disk-kibana" {
  name     = "disk-kibana"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 8

}


resource "yandex_compute_disk" "disk-elastic" {
  name     = "disk-elastic"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  image_id = "fd88rqql4soidsdqf98a"
  size     = 20

}
