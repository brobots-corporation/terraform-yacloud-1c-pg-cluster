provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

module "network" {
  # SETTINGS: Если необходим отказоустойчевый кластер СУБД, то в модуле нужно раскомментировать ряд строк
  source = "./modules/network"
  zones = var.zones
  v4_cidr_blocks = var.v4_cidr_blocks
}

# TODO: разделить модуль на типы машин в кластере 1С (центральный сервер, рабочий экземпляр, лицензирование, регламентные задания)

module "ya-1c" {
  source = "./modules/ya-1c"

  count_app1c_servers     = var.count_app1c_servers         # Количество серверов
  path_to_metadatefile    = var.path_to_metadatefile        # Путь к файлу с метаданными для создаваемой машины
  lm_subnets_zones        = module.network.lm_subnets_zones # Список зон доступности с созданными в них подсетями
  fqdn_prefix             = var.fqdn_prefix                 # Префикс для FQDN имени машин в локальной сети
  ansible_format_output   = var.ansible_format_output       # Вывод информации по хостам в формате inventory для ansible

  instance_cores          = var.instance_cores_1c           # Количество ядер на машину
  instance_memory         = var.instance_memory_1c          # Объем RAM на машину
  instance_core_fraction  = var.instance_core_fraction_1c   # Процент доступности процессора
  os_image_id             = var.os_image_id_1c              # Образ ОС для сервера
  instance_disk_size      = var.instance_disk_size_1c       # Размер HDD
  instance_disk_type      = var.instance_disk_type_1c       # Тип диска
  instance_preemptible    = var.instance_preemptible_1c     # Прерываемость машины
}  

module "ya-pg" {
  # SETTINGS: Если необходим отказоустойчевый кластер СУБД, то в модуле нужно раскомментировать ряд строк
  source = "./modules/ya-pg"
 
  vpc_id              = module.network.vpc_id           # Основная подсеть для мастера в кластере
  lm_subnets_zones    = module.network.lm_subnets_zones # Список зон доступности с созданными в них подсетями

  environment         = var.environment                 # Тип среды окружения
  pg_version          = var.pg_version                  # Версия СУБД Postgresql в кластере
  resource_preset_id  = var.resource_preset_id          # Тип хоста для кластера. Тип определяет CPU и RAM
  disk_type_id        = var.disk_type_id                # Тип диска в хостах кластера
  disk_size           = var.disk_size                   # Размер диска для всех хостов

  db_name             = var.db_name                     # Наименование БД в кластере
  owner               = var.owner                       # Владелец БД
  lc_collate          = var.lc_collate                  # Локаль для порядка сортировка строк в БД
  lc_type             = var.lc_type                     # Локаль для классификации символов в БД
  cluster_user_name   = var.cluster_user_name           # Имя пользователя кластера СУБД
  cluster_user_pass   = var.cluster_user_pass           # Пароль пользователя кластера СУБД
} 