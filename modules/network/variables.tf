variable "zones" {
  # REQUIRED
  description = "Список зон провайдера (Владимирская, Рязанская и Московская области)"
}
variable "v4_cidr_blocks" {
  # REQUIRED
  description = "Пул ipv4 адресов, который будет использоваться при создании подсети"
}
