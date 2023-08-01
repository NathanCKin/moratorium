# The name of this view in Looker is "Verisk A Plus Calls"
view: verisk_a_plus_calls {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.verisk_a_plus_calls ;;
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
    # This dimension will be called "Bright Policy ID" in Explore.

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: claim_count {
    type: number
    sql: ${TABLE}."claim_count" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_claim_count {
    type: sum
    sql: ${claim_count} ;;  }
  measure: average_claim_count {
    type: average
    sql: ${claim_count} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: error_info {
    type: string
    sql: ${TABLE}."error_info" ;;
  }

  dimension: quoteback {
    type: string
    sql: ${TABLE}."quoteback" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: response {
    type: string
    sql: ${TABLE}."response" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
