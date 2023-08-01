# The name of this view in Looker is "Critical Notice Events"
view: critical_notice_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.critical_notice_events ;;
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

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: created_in_pas {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_in_pas" ;;
  }

  dimension_group: event_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."event_created_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Event Name" in Explore.

  dimension: event_name {
    type: string
    sql: ${TABLE}."event_name" ;;
  }

  dimension: http_response_code {
    type: string
    sql: ${TABLE}."http_response_code" ;;
  }

  dimension_group: http_response_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."http_response_timestamp" ;;
  }

  dimension: policy_email_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."policy_email_id" ;;
  }

  dimension: policy_id {
    type: number
    sql: ${TABLE}."policy_id" ;;
  }

  dimension: policy_notice_event_id {
    type: string
    sql: ${TABLE}."policy_notice_event_id" ;;
  }

  dimension: policy_term {
    type: number
    sql: ${TABLE}."policy_term" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_policy_term {
    type: sum
    sql: ${policy_term} ;;  }
  measure: average_policy_term {
    type: average
    sql: ${policy_term} ;;  }

  dimension: primary_insured_id {
    type: number
    sql: ${TABLE}."primary_insured_id" ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."sent_at" ;;
  }

  dimension: sent_to_user_id {
    type: number
    sql: ${TABLE}."sent_to_user_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, event_name, policy_emails.id]
  }
}
