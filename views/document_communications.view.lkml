# The name of this view in Looker is "Document Communications"
view: document_communications {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.document_communications ;;
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

  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."delivered_at" ;;
  }

  dimension: docset_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."docset_id" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."external_id" ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}."provider" ;;
  }

  dimension: recipient_data {
    type: string
    sql: ${TABLE}."recipient_data" ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."sent_at" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: to {
    type: string
    sql: ${TABLE}."to" ;;
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
    drill_fields: [id, docsets.id]
  }
}
