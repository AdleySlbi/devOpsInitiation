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
