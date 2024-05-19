resource "aws_glue_catalog_database" "ccindex" {
  name = "steven_ccindex"
}


output "database_name" {
  value = aws_glue_catalog_database.ccindex.name
}
