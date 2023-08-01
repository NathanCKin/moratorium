# The name of this view in Looker is "Moratoria"
view: moratoria {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.moratoria ;;
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
    # This dimension will be called "Area" in Explore.

  dimension: area {
    type: string
    sql: ${TABLE}."area" ;;
  }

  dimension: counties {
    type: string
    sql: ${TABLE}."counties" ;;
  }

  dimension: counties_list {
    type: string
    sql: ${TABLE}."counties_list" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}."created_by" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: deleted_by {
    type: string
    sql: ${TABLE}."deleted_by" ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date" ;;
  }

  dimension_group: ends {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."ends_at" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: national_weather_service_alert_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."national_weather_service_alert_id" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_date" ;;
  }

  dimension_group: starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."starts_at" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: weather_event {
    type: number
    sql: ${TABLE}."weather_event" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_weather_event {
    type: sum
    sql: ${weather_event} ;;  }
  measure: average_weather_event {
    type: average
    sql: ${weather_event} ;;  }
  measure: count {
    type: count
    drill_fields: [id, name, national_weather_service_alerts.id]
  }
}
