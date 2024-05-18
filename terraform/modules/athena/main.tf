variable "database_name" {
  type = string
}

resource "aws_glue_catalog_table" "ccindex" {
  name          = "ccindex"
  database_name = var.database_name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL = "TRUE"
  }

  storage_descriptor {
    location      = "s3://commoncrawl/cc-index/table/cc-main/warc/"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "parquet"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = "1"
      }
    }

    columns {
      name = "url_surtkey"
      type = "string"
    }

    columns {
      name = "url"
      type = "string"
    }

    columns {
      name = "url_host_name"
      type = "string"
    }

    columns {
      name = "url_host_tld"
      type = "string"
    }

    columns {
      name = "url_host_2nd_last_part"
      type = "string"
    }

    columns {
      name = "url_host_3rd_last_part"
      type = "string"
    }

    columns {
      name = "url_host_4th_last_part"
      type = "string"
    }

    columns {
      name = "url_host_5th_last_part"
      type = "string"
    }

    columns {
      name = "url_host_registry_suffix"
      type = "string"
    }

    columns {
      name = "url_host_registered_domain"
      type = "string"
    }

    columns {
      name = "url_host_private_suffix"
      type = "string"
    }

    columns {
      name = "url_host_private_domain"
      type = "string"
    }

    columns {
      name = "url_protocol"
      type = "string"
    }

    columns {
      name = "url_port"
      type = "int"
    }

    columns {
      name = "url_path"
      type = "string"
    }

    columns {
      name = "url_query"
      type = "string"
    }

    columns {
      name = "fetch_time"
      type = "timestamp"
    }

    columns {
      name = "fetch_status"
      type = "smallint"
    }

    columns {
      name = "content_digest"
      type = "string"
    }

    columns {
      name = "content_mime_type"
      type = "string"
    }

    columns {
      name = "content_mime_detected"
      type = "string"
    }

    columns {
      name = "content_charset"
      type = "string"
    }

    columns {
      name = "content_languages"
      type = "string"
    }

    columns {
      name = "warc_filename"
      type = "string"
    }

    columns {
      name = "warc_record_offset"
      type = "int"
    }

    columns {
      name = "warc_record_length"
      type = "int"
    }

    columns {
      name = "warc_segment"
      type = "string"
    }
  }

  partition_keys {
    name = "crawl"
    type = "string"
  }

  partition_keys {
    name = "subset"
    type = "string"
  }
}
