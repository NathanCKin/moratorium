# The name of this view in Looker is "Postal Notice Events"
view: postal_notice_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.postal_notice_events ;;
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
    # This dimension will be called "Mailing Status" in Explore.

  dimension: mailing_status {
    type: string
    sql: ${TABLE}."mailing_status" ;;
  }

  dimension: policy_notice_event_id {
    type: string
    sql: ${TABLE}."policy_notice_event_id" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
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
