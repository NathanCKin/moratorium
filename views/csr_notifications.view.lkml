# The name of this view in Looker is "Csr Notifications"
view: csr_notifications {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.csr_notifications ;;
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
    # This dimension will be called "Csr ID" in Explore.

  dimension: csr_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."csr_id" ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}."event_name" ;;
  }

  dimension: notifier_id {
    type: number
    sql: ${TABLE}."notifier_id" ;;
  }

  dimension: notifier_type {
    type: string
    sql: ${TABLE}."notifier_type" ;;
  }

  dimension: unread {
    type: yesno
    sql: ${TABLE}."unread" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, event_name, csrs.display_name, csrs.id]
  }
}
