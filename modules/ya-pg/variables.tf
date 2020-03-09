## Настройка сети и отказоустойчивости кластера\
variable "vpc_id" {
  # REQUIRED
  description = "Основная подсеть для мастера в кластере"
}
variable "lm_subnets_zones" {
  # REQUIRED
  description = "Список зон доступности с созданными в них подсетями"
}


## Характеристики кластера СУБД
variable "environment" {
  # OPTIONAL
  default = "PRESTABLE"
}
variable "pg_version" {
  # OPTIONAL
  description = "Версия СУБД Postgresql в кластере"
  default = "10-1c"
}
variable "resource_preset_id" {
  # OPTIONAL
  description = "Тип хоста для кластера. Тип определяет CPU и RAM"
  default = "s2.micro"
}
variable "disk_type_id" {
  # OPTIONAL
  description = "Тип диска в хостах кластера"
  default = "network-ssd"
}
variable "disk_size" {
  # OPTIONAL
  description = "Размер диска у хостов"
  default = 40
}


## Настройки БД
variable "db_name" {
  # OPTIONAL
  description = "Наименование БД в кластере"
  default = "testbase"
}
variable "owner" {
  # OPTIONAL
  description = "Владелец БД"
  default = "user1cv8"
}
variable "lc_collate" {
  # OPTIONAL
  description = "Локаль для порядка сортировка строк в БД"
  default = "ru_RU.UTF-8"
}
variable "lc_type" {
  # OPTIONAL
  description = "Локаль для классификации символов в БД"
  default = "ru_RU.UTF-8"
}
variable "cluster_user_name" {
  # OPTIONAL
  description = "Имя пользователя кластера СУБД"
  default = "user1cv8"
}
variable "cluster_user_pass" {
  # REQUIRED
  description = "Пароль пользователя кластера СУБД"
}