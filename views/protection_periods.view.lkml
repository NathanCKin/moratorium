# The name of this view in Looker is "Protection Periods"
view: protection_periods {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.protection_periods ;;
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
    # This dimension will be called "Config" in Explore.

  dimension: config {
    type: string
    sql: ${TABLE}."config" ;;
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

  dimension: executive_order_name {
    type: string
    sql: ${TABLE}."executive_order_name" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
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
  measure: count {
    type: count
    drill_fields: [id, name, executive_order_name]
  }
}
