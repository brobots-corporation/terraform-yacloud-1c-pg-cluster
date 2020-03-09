# Вывод id virtual private network
output "vpc_id" {
  value = module.network.vpc_id
}
# Вывод информации по подсетям (зона доступности и id подсети) 
output "subnet_vpc_id" {
  value = [
    for val in module.network.lm_subnets_zones: "zone: ${val.zone} - subnet: ${val.subnet_id}"
  ]
}
# Вывод информации по кластеру 1С (имя хоста и его внешний ipv4)
output "ya-1c-cluster" {
  value = module.ya-1c.ansible_hosts
}
# Вывод информации по кластеру СУБД (FQDN хостов в кластере)
output "fqdn-pg-cluster-1c" {
  value = module.ya-pg.fqdn-pg-cluster-1c
}