# Вывод информации по кластеру СУБД (FQDN хостов в кластере)
output "fqdn-pg-cluster-1c" {
  value = yandex_mdb_postgresql_cluster.pg-cluster-1c.host.*.fqdn
}