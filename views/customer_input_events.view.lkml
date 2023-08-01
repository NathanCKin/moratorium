# The name of this view in Looker is "Customer Input Events"
view: customer_input_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.customer_input_events ;;
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
    # This dimension will be called "Customer Input Response ID" in Explore.

  dimension: customer_input_response_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."customer_input_response_id" ;;
  }

  dimension: funnel {
    type: string
    sql: ${TABLE}."funnel" ;;
  }

  dimension: funnel_class {
    type: string
    sql: ${TABLE}."funnel_class" ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."metadata" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: params {
    type: string
    sql: ${TABLE}."params" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."path" ;;
  }

  dimension: step {
    type: string
    sql: ${TABLE}."step" ;;
  }

  dimension: step_class {
    type: string
    sql: ${TABLE}."step_class" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, customer_input_responses.id]
  }
}
