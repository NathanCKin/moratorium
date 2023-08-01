# The name of this view in Looker is "Validation Checks"
view: validation_checks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.validation_checks ;;
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
    # This dimension will be called "Failed" in Explore.

  dimension: failed {
    type: yesno
    sql: ${TABLE}."failed" ;;
  }

  dimension: failures {
    type: string
    sql: ${TABLE}."failures" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: successes {
    type: string
    sql: ${TABLE}."successes" ;;
  }

  dimension: term_number {
    type: number
    sql: ${TABLE}."term_number" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_term_number {
    type: sum
    sql: ${term_number} ;;  }
  measure: average_term_number {
    type: average
    sql: ${term_number} ;;  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: validation_run_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."validation_run_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, validation_runs.id]
  }
}
