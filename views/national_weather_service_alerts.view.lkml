# The name of this view in Looker is "National Weather Service Alerts"
view: national_weather_service_alerts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.national_weather_service_alerts ;;
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
    # This dimension will be called "Affected Area" in Explore.

  dimension: affected_area {
    type: string
    sql: ${TABLE}."affected_area" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: alert_expiration {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."alert_expiration" ;;
  }

  dimension: alert_id {
    type: string
    sql: ${TABLE}."alert_id" ;;
  }

  dimension: alert_url {
    type: string
    sql: ${TABLE}."alert_url" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }

  dimension: certainty {
    type: string
    sql: ${TABLE}."certainty" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: effective_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."effective_end" ;;
  }

  dimension_group: effective_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."effective_start" ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}."event" ;;
  }

  dimension: event_references {
    type: string
    sql: ${TABLE}."event_references" ;;
  }

  dimension: fips_codes {
    type: string
    sql: ${TABLE}."fips_codes" ;;
  }

  dimension: headline {
    type: string
    sql: ${TABLE}."headline" ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}."message_type" ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}."severity" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: urgency {
    type: string
    sql: ${TABLE}."urgency" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, moratoria.count]
  }
}
