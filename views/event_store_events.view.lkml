# The name of this view in Looker is "Event Store Events"
view: event_store_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.event_store_events ;;
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
    # This dimension will be called "Data" in Explore.

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}."event_id" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."event_type" ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."metadata" ;;
  }

  dimension_group: valid {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."valid_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
