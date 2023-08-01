# The name of this view in Looker is "Csr Quotes"
view: csr_quotes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.csr_quotes ;;
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

  dimension: csr_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."csr_id" ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}."message" ;;
  }

  dimension: non_user_email {
    type: string
    sql: ${TABLE}."non_user_email" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: rating_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."rating_id" ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."sent_at" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, csrs.display_name, csrs.id, ratings.id]
  }
}
