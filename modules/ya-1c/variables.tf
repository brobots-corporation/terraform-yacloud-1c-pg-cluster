 ## Количество серверов и их метаданные
variable "count_app1c_servers" {
   # REQUIRED
   description = "Количество серверов в кластере"
 }
variable "path_to_metadatefile" {
  # REQUIRED
  description = "Путь к файлу с метаданными о пользователях OC"
}


## Параметры сети
variable "lm_subnets_zones" {
  # REQUIRED
  description = "Список зон доступности с созданными в них подсетями"
}
variable "fqdn_prefix" {
   # REQUIRED
  description = "Префикс для FQDN имен машин в локальной сети. Машины доступны по адресу: <hostname>.<region_id>.internal"
}
variable "ansible_format_output" {
  # OPTIONAL
  description = "Вывод информации по машинам кластера 1С в формате для файла inventory ansible"
  default = false
}


## Параметры серверов 1С
variable "instance_cores" {
  # OPTIONAL
  description = "Количество ядер на один инстанс"
  default     = "2"
}
variable "instance_memory" {
  # OPTIONAL
  description = "Количество памяти в ГБ на один инстанс"
  default     = "8"
}
variable "instance_core_fraction" {
  # OPTIONAL
  description = "Гарантированная доля vCPU"
  default     = "20"
}
variable "os_image_id" {
  # OPTIONAL
  default = "fd8qv9fp3fv1k2b9qan0"
}
variable "instance_disk_size" {
  # OPTIONAL
  description = "Размер диска в ГБ"
  default     = "20"
}
variable "instance_disk_type" {
  # OPTIONAL
  description = "Тип диска"
  default     = "network-hdd"
}
variable "instance_preemptible" {
  # OPTIONAL
  description = "Прерывания машины, работает не более 24 часов и может быть остановлена Облаком в любой момент"
  default     = "true"
}