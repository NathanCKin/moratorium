# The name of this view in Looker is "Event Store Events In Streams"
view: event_store_events_in_streams {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.event_store_events_in_streams ;;
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
    # This dimension will be called "Event ID" in Explore.

  dimension: event_id {
    type: string
    sql: ${TABLE}."event_id" ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_position {
    type: sum
    sql: ${position} ;;  }
  measure: average_position {
    type: average
    sql: ${position} ;;  }

  dimension: stream {
    type: string
    sql: ${TABLE}."stream" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
