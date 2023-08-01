# The name of this view in Looker is "Accounting Metadata"
view: accounting_metadata {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.accounting_metadata ;;
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
    # This dimension will be called "Policy Event ID" in Explore.

  dimension: policy_event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."policy_event_id" ;;
  }

  dimension: policy_id {
    type: number
    sql: ${TABLE}."policy_id" ;;
  }

  dimension: scheduled_transaction_id {
    type: number
    sql: ${TABLE}."scheduled_transaction_id" ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}."term" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_term {
    type: sum
    sql: ${term} ;;  }
  measure: average_term {
    type: average
    sql: ${term} ;;  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, policy_events.id]
  }
}
