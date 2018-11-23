resource "heroku_addon" "staging" {
  app  = "${heroku_app.staging.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon" "production" {
  app  = "${heroku_app.production.name}"
  plan = "heroku-postgresql:hobby-dev"
}
