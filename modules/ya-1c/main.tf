resource "yandex_compute_instance" "app1c-server" {
  name      = "app1c-server-${count.index}"
  hostname  = "${var.fqdn_prefix}-app1c-server-${count.index}"
  count     = var.count_app1c_servers
  zone      = var.lm_subnets_zones[0]["zone"]

  # Описание параметров виртуальной машины
  resources {
    cores         = var.instance_cores
    memory        = var.instance_memory
    core_fraction = var.instance_core_fraction
  }

  # Включение прерывания машины, работает не более 24 часов и может быть остановлена Облаком в любой момент
  scheduling_policy {
    preemptible = var.instance_preemptible
  }

  # Указание характеристик диска
  boot_disk {
    initialize_params {
      image_id = var.os_image_id # CentOS 7, просмотр id общих образов возможен только через CLI
      size     = var.instance_disk_size
      type     = var.instance_disk_type
    }
  }

  network_interface {
    subnet_id = var.lm_subnets_zones[0]["subnet_id"]
    nat       = true
  }

  metadata = {
    user-data = file(var.path_to_metadatefile)
  }

}