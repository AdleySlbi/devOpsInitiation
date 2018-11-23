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
