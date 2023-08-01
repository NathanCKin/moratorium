# The name of this view in Looker is "Claim Payments"
view: claim_payments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.claim_payments ;;
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
    # This dimension will be called "Address City" in Explore.

  dimension: address_city {
    type: string
    sql: ${TABLE}."address_city" ;;
  }

  dimension: address_line_one {
    type: string
    sql: ${TABLE}."address_line_one" ;;
  }

  dimension: address_line_two {
    type: string
    sql: ${TABLE}."address_line_two" ;;
  }

  dimension: address_postal_code {
    type: string
    sql: ${TABLE}."address_postal_code" ;;
  }

  dimension: address_state {
    type: string
    sql: ${TABLE}."address_state" ;;
  }

  dimension: amount_cents {
    type: number
    sql: ${TABLE}."amount_cents" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount_cents {
    type: sum
    sql: ${amount_cents} ;;  }
  measure: average_amount_cents {
    type: average
    sql: ${amount_cents} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."approved_at" ;;
  }

  dimension_group: approved_reported {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."approved_reported_at" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension_group: cancelled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."cancelled_at" ;;
  }

  dimension_group: cancelled_reported {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."cancelled_reported_at" ;;
  }

  dimension: claim_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."claim_id" ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}."contact_email" ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}."contact_name" ;;
  }

  dimension: contact_phone_number {
    type: string
    sql: ${TABLE}."contact_phone_number" ;;
  }

  dimension: cost_category {
    type: string
    sql: ${TABLE}."cost_category" ;;
  }

  dimension: cost_kind {
    type: string
    sql: ${TABLE}."cost_kind" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: invalidated {
    type: yesno
    sql: ${TABLE}."invalidated" ;;
  }

  dimension: invoice_date {
    type: string
    sql: ${TABLE}."invoice_date" ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}."invoice_number" ;;
  }

  dimension: snapsheet_id {
    type: string
    sql: ${TABLE}."snapsheet_id" ;;
  }

  dimension: transaction_kind {
    type: string
    sql: ${TABLE}."transaction_kind" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, contact_name, claims.id, claims.carrier_name]
  }
}
