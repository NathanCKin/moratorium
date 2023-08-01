# The name of this view in Looker is "Near Map Surveys Requests"
view: near_map_surveys_requests {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.near_map_surveys_requests ;;
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
    # This dimension will be called "Code" in Explore.

  dimension: code {
    type: number
    sql: ${TABLE}."code" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_code {
    type: sum
    sql: ${code} ;;  }
  measure: average_code {
    type: average
    sql: ${code} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: near_map_location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."near_map_location_id" ;;
  }

  dimension: response {
    type: string
    sql: ${TABLE}."response" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."url" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, near_map_locations.id]
  }
}
