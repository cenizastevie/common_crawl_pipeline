module "glue" {
  source = "./modules/glue"
}

module "athena" {
  source        = "./modules/athena"
  database_name = module.glue.database_name
}
