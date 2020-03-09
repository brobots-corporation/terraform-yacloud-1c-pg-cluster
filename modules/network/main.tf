resource "yandex_vpc_network" "vpc_stage_cluster" {
}

resource "yandex_vpc_subnet" "subnet_0" {
  # Использование зоны доступности по умолчанию
  zone           = var.zones[0]
  network_id     = yandex_vpc_network.vpc_stage_cluster.id 
  v4_cidr_blocks = var.v4_cidr_blocks[0]
}

# SETTINGS: Укание дополнительной зоны для создание подсети для отказоусточевого кластера СУБД. 
# SETTINGS: Если он необходим, то нужно раскомментировать 5 строк ниже
resource "yandex_vpc_subnet" "subnet_1" {
  zone           = var.zones[1]
  network_id     = yandex_vpc_network.vpc_stage_cluster.id
  v4_cidr_blocks = var.v4_cidr_blocks[1]
}