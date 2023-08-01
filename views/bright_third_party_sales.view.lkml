# The name of this view in Looker is "Bright Third Party Sales"
view: bright_third_party_sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bright_third_party_sales ;;
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
    # This dimension will be called "Address ID" in Explore.

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: bind_category {
    type: string
    sql: ${TABLE}."bind_category" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: bound {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."bound_at" ;;
  }

  dimension: bound_by_id {
    type: number
    sql: ${TABLE}."bound_by_id" ;;
  }

  dimension: bound_premium_cents {
    type: number
    sql: ${TABLE}."bound_premium_cents" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bound_premium_cents {
    type: sum
    sql: ${bound_premium_cents} ;;  }
  measure: average_bound_premium_cents {
    type: average
    sql: ${bound_premium_cents} ;;  }

  dimension: bound_premium_currency {
    type: string
    sql: ${TABLE}."bound_premium_currency" ;;
  }

  dimension: cancellation_reason {
    type: string
    sql: ${TABLE}."cancellation_reason" ;;
  }

  dimension: cancellation_reason_other {
    type: string
    sql: ${TABLE}."cancellation_reason_other" ;;
  }

  dimension_group: cancelled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."cancelled_at" ;;
  }

  dimension: cancelled_by_id {
    type: number
    sql: ${TABLE}."cancelled_by_id" ;;
  }

  dimension: coverage_a {
    type: number
    sql: ${TABLE}."coverage_a" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."expiration_date" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."external_id" ;;
  }

  dimension: external_url {
    type: string
    sql: ${TABLE}."external_url" ;;
  }

  dimension: info {
    type: string
    sql: ${TABLE}."info" ;;
  }

  dimension: legacy_tps_id {
    type: number
    sql: ${TABLE}."legacy_tps_id" ;;
  }

  dimension: payment_schedule {
    type: string
    sql: ${TABLE}."payment_schedule" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: policy_type {
    type: string
    sql: ${TABLE}."policy_type" ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
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

  dimension: why_not_kin_details {
    type: string
    sql: ${TABLE}."why_not_kin_details" ;;
  }

  dimension: why_not_kin_reason {
    type: string
    sql: ${TABLE}."why_not_kin_reason" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, products.id]
  }
}
