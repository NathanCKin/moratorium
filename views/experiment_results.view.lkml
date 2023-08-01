# The name of this view in Looker is "Experiment Results"
view: experiment_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.experiment_results ;;
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

  dimension: customer_input_response_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."customer_input_response_id" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}."result" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, customer_input_responses.id]
  }
}
