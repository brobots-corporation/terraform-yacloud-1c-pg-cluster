######### Переменные с данными провайдера
variable "token" {
  description = "OAuth токен"
}
variable "cloud_id" {
  description = "Yandex Cloud ID"
}
variable "folder_id" {
  description = "Yandex Cloud Folder ID"
}


######### Настройки сети
variable "v4_cidr_blocks" {
  default = [["192.168.10.0/24"], ["192.168.11.0/24"], ["192.168.12.0/24"]]
}
variable "fqdn_prefix" {
  description = "Префикс для FQDN имен машин в локальной сети. Машины доступны по адресу: <hostname>.<region_id>.internal"
}
variable "ansible_format_output" {
  description = "Вывод информации по машинам кластера 1С в формате для файла inventory ansible"
}


######### Метаданные для передачи в compute_instance
variable "path_to_metadatefile" {
  description = "Путь к файлу с метаданными о пользователях OC"
}


######### Количества серверов по назначению и их расположения в зонах доступности
variable "count_app1c_servers" {
  description = "Количество серверов с приложением 1С"  
}
variable "zones" {
  description = "Список зон провайдера (Владимирская, Рязанская и Московская области)"
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-b"]
}


######### Параметры для серверов 1С
variable "instance_cores_1c" {
  description = "Количество ядер на один инстанс"
}
variable "instance_memory_1c" {
  description = "Количество памяти в ГБ на один инстанс"
}
variable "instance_core_fraction_1c" {
  description = "Гарантированная доля vCPU"
}

variable "os_image_id_1c" {
  # Получить образы можно командой: yc compute image list --folder-id standard-images
  # Получить последний образ семейства: yc compute image get-latest-from-family centos-7 --folder-id standard-images
}
variable "instance_disk_size_1c" {
  description = "Размер диска в ГБ"
}
variable "instance_disk_type_1c" {
  description = "Тип диска"
}
variable "instance_preemptible_1c" {
  description = "Прерывания машины, работает не более 24 часов и может быть остановлена Облаком в любой момент"
}


######### Параметры и настройки кластера СУБД Postgresql

## Характеристики кластера СУБД
variable "environment" {
}
variable "pg_version" {
  description = "Версия СУБД Postgresql в кластере"
}
variable "resource_preset_id" {
  description = "Тип хоста для кластера. Тип определяет CPU и RAM"
}
variable "disk_type_id" {
  description = "Тип диска в хостах кластера"
}
variable "disk_size" {
  description = "Размер диска у хостов"
}


## Настройки БД
variable "db_name" {
  description = "Наименование БД в кластере"
}
variable "owner" {
  description = "Владелец БД"
}
variable "lc_collate" {
  description = "Локаль для порядка сортировка строк в БД"
}
variable "lc_type" {
  description = "Локаль для классификации символов в БД"
}
variable "cluster_user_name" {
  description = "Имя пользователя кластера СУБД"
}
variable "cluster_user_pass" {
  description = "Пароль пользователя кластера СУБД"
}