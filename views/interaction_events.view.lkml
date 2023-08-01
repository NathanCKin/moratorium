# The name of this view in Looker is "Interaction Events"
view: interaction_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.interaction_events ;;
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
    # This dimension will be called "Action" in Explore.

  dimension: action {
    type: string
    sql: ${TABLE}."action" ;;
  }

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

  dimension: funnel_class {
    type: string
    sql: ${TABLE}."funnel_class" ;;
  }

  dimension: interactor_id {
    type: number
    sql: ${TABLE}."interactor_id" ;;
  }

  dimension: params {
    type: string
    sql: ${TABLE}."params" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."path" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: step_class {
    type: string
    sql: ${TABLE}."step_class" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
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
