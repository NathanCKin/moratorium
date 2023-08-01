# The name of this view in Looker is "Policy Applications"
view: policy_applications {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_applications ;;
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

  dimension: co_signature {
    type: string
    sql: ${TABLE}."co_signature" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: co_signed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."co_signed_at" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: document_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."document_id" ;;
  }

  dimension: invalidated {
    type: yesno
    sql: ${TABLE}."invalidated" ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}."signature" ;;
  }

  dimension_group: signed_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."signed_at" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, documents.id]
  }
}
