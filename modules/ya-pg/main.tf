resource "yandex_mdb_postgresql_cluster" "pg-cluster-1c" {
  name  = "pg-cluster-1c"

  environment = var.environment
  network_id  = var.vpc_id

  # Описание параметров виртуальной машины
  config {
    version = var.pg_version
    resources {
      resource_preset_id = var.resource_preset_id
      disk_type_id       = var.disk_type_id
      disk_size          = var.disk_size
    }
  }
  # Описание параметров создаваемой БД
  database {
    name        = var.db_name
    owner       = var.owner
    lc_collate  = var.lc_collate
    lc_type     = var.lc_type
  }
  # Информация по пользователю кластера
  user {
    name     = var.cluster_user_name
    password = var.cluster_user_pass
    permission {
      database_name = var.db_name
    }
  }

  # Описание используемых хостов для построения кластера СУБД
  host {
    zone              = var.lm_subnets_zones[0]["zone"]
    subnet_id         = var.lm_subnets_zones[0]["subnet_id"]
    assign_public_ip  = true
  }
  # SETTINGS: Если необходим отказоустойчевый кластер СУБД, то в модуле нужно раскомментировать следующих 5 строк
  host {
    zone              = var.lm_subnets_zones[1]["zone"]
    subnet_id         = var.lm_subnets_zones[1]["subnet_id"]
    assign_public_ip  = true
  }

}
