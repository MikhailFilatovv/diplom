variable "yandex_cloud_token" {
  type = string
  description = "секретный токен"
  sensitive = true
}

variable "cloud_id" {
  type = string
  description = "Идентификатор облака"
}

variable "folder_id" {
  type = string
  description = "Идентификатор группы хостов"

}

variable "image_id" {
  type = string
  description = "Идентификатор дистрибутива"
}
