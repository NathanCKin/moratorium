# The name of this view in Looker is "Policy Contacts"
view: policy_contacts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_contacts ;;
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
    # This dimension will be called "Contact ID" in Explore.

  dimension: contact_id {
    type: number
    sql: ${TABLE}."contact_id" ;;
  }

  dimension: contact_type {
    type: string
    sql: ${TABLE}."contact_type" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: payment_method_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."payment_method_id" ;;
  }

  dimension: payment_method_type {
    type: string
    sql: ${TABLE}."payment_method_type" ;;
  }

  dimension: policy_id {
    type: number
    sql: ${TABLE}."policy_id" ;;
  }

  dimension: policy_type {
    type: string
    sql: ${TABLE}."policy_type" ;;
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
    drill_fields: [id, payment_methods.id, policy_packets.count]
  }
}
