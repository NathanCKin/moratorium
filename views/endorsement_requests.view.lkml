# The name of this view in Looker is "Endorsement Requests"
view: endorsement_requests {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.endorsement_requests ;;
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

  dimension: created_by_id {
    type: number
    sql: ${TABLE}."created_by_id" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date" ;;
  }

  dimension: endorsement_id {
    type: number
    sql: ${TABLE}."endorsement_id" ;;
  }

  dimension: initial_policy_contacts {
    type: string
    sql: ${TABLE}."initial_policy_contacts" ;;
  }

  dimension: initial_policy_settings {
    type: string
    sql: ${TABLE}."initial_policy_settings" ;;
  }

  dimension: previous_billing_transactions {
    type: string
    sql: ${TABLE}."previous_billing_transactions" ;;
  }

  dimension: requested_by {
    type: string
    sql: ${TABLE}."requested_by" ;;
  }

  dimension: saved_changeset {
    type: string
    sql: ${TABLE}."saved_changeset" ;;
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
    drill_fields: [id, billing_draft_transactions.count, billing_scheduled_transactions.count]
  }
}
