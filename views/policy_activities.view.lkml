# The name of this view in Looker is "Policy Activities"
view: policy_activities {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_activities ;;
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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}."record_id" ;;
  }

  dimension: record_type {
    type: string
    sql: ${TABLE}."record_type" ;;
  }

  dimension: total_premium_cents {
    type: number
    sql: ${TABLE}."total_premium_cents" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_premium_cents {
    type: sum
    sql: ${total_premium_cents} ;;  }
  measure: average_total_premium_cents {
    type: average
    sql: ${total_premium_cents} ;;  }

  dimension: total_premium_currency {
    type: string
    sql: ${TABLE}."total_premium_currency" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: whodunnit {
    type: string
    sql: ${TABLE}."whodunnit" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
