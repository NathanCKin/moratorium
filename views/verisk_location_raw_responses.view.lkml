# The name of this view in Looker is "Verisk Location Raw Responses"
view: verisk_location_raw_responses {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.verisk_location_raw_responses ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Response" in Explore.

  dimension: response {
    type: string
    sql: ${TABLE}."response" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: verisk_location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."verisk_location_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, verisk_locations.id, verisk_locations.distance_to_coast_name]
  }
}
