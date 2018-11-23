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

# Create new app
resource "heroku_app" "staging" {
  name   = "stagingdevopswsf"
  region = "eu"

  config_vars {
    FOOBAR = "baz"
  }

  buildpacks = [
    "heroku/go",
  ]
}

# Create new app
resource "heroku_app" "production" {
  name   = "productiondevopswsf"
  region = "eu"

  config_vars {
    FOOBAR = "baz"
  }

  buildpacks = [
    "heroku/go",
  ]
}

# Create a Heroku pipeline
resource "heroku_pipeline" "ourapppipeline" {
  name = "ourapppipeline"
}

# Couple apps to different pipeline stages
resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.ourapppipeline.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.ourapppipeline.id}"
  stage    = "production"
}
