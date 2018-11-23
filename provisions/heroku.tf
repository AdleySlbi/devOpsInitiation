provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

# Déclaration des variables que nous utiliserons
variable "heroku_api_key" {
  type = "string"
}

variable "heroku_email" {
  type = "string"
}
