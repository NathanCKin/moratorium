# The name of this view in Looker is "Active Storage Blobs"
view: active_storage_blobs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.active_storage_blobs ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Byte Size" in Explore.

  dimension: byte_size {
    type: number
    sql: ${TABLE}."byte_size" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_byte_size {
    type: sum
    sql: ${byte_size} ;;  }
  measure: average_byte_size {
    type: average
    sql: ${byte_size} ;;  }

  dimension: checksum {
    type: string
    sql: ${TABLE}."checksum" ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}."content_type" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}."filename" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."metadata" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, filename]
  }
}
