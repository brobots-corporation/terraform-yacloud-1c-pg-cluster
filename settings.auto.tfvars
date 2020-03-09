######### Настройки сети
v4_cidr_blocks          = [["192.168.10.0/24"], ["192.168.11.0/24"], ["192.168.12.0/24"]]
fqdn_prefix             = "mwixbot"
ansible_format_output   = false


######### Метаданные для передачи в compute_instance
path_to_metadatefile = "metadata.yml"


######### Количества серверов по назначению и их расположения в зонах доступности
count_app1c_servers = "2"
zones               = ["ru-central1-a", "ru-central1-b", "ru-central1-b"]


######### Параметры для серверов 1С
instance_cores_1c           = "2"
instance_memory_1c          = "8"
instance_core_fraction_1c   = "20"
os_image_id_1c              = "fd8ti195vru1hi3ivdue"
instance_disk_size_1c       = "20"
instance_disk_type_1c       = "network-hdd"
instance_preemptible_1c     = "true"


######### Параметры кластера СУБД Postgresql

## Характеристики кластера СУБД
environment         = "PRESTABLE"
pg_version          = "10-1c"
resource_preset_id  = "s2.micro"
disk_type_id        = "network-ssd"
disk_size           = 40

## Настройки БД
db_name             = "testbase"
owner               = "user1cv8"
lc_collate          = "ru_RU.UTF-8"
lc_type             = "ru_RU.UTF-8"
cluster_user_name   = "user1cv8"