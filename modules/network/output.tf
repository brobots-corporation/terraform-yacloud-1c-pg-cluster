# Вывод id virtual private network
output "vpc_id" {
    value = yandex_vpc_network.vpc_stage_cluster.id
}
# Вывод информации по подсетям (зона доступности и id подсети)
output "lm_subnets_zones" {
  value = [
      {
      zone = yandex_vpc_subnet.subnet_0.zone
      subnet_id = yandex_vpc_subnet.subnet_0.id
      }
      # SETTINGS: Укание дополнительной подсети и зоны для отказоусточевого кластера СУБД.
      # SETTINGS: Если он необходим, то нужно раскомментировать 4 строки ниже
      ,{
      zone = yandex_vpc_subnet.subnet_1.zone
      subnet_id = yandex_vpc_subnet.subnet_1.id
      }
  ]
}
