# The name of this view in Looker is "Policy Administration Effective Policies"
view: policy_administration_effective_policies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_administration_effective_policies ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Aggregate Root ID" in Explore.

  dimension: aggregate_root_id {
    type: string
    sql: ${TABLE}."aggregate_root_id" ;;
  }

  dimension: coverage {
    type: string
    sql: ${TABLE}."coverage" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date" ;;
  }

  dimension: payment_schedule {
    type: string
    sql: ${TABLE}."payment_schedule" ;;
  }

  dimension: property {
    type: string
    sql: ${TABLE}."property" ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}."rating" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."status" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_status {
    type: sum
    sql: ${status} ;;  }
  measure: average_status {
    type: average
    sql: ${status} ;;  }

  dimension: term {
    type: number
    sql: ${TABLE}."term" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
