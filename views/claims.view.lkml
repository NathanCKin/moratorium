# The name of this view in Looker is "Claims"
view: claims {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.claims ;;
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
    # This dimension will be called "Address Line One" in Explore.

  dimension: address_line_one {
    type: string
    sql: ${TABLE}."address_line_one" ;;
  }

  dimension: address_line_two {
    type: string
    sql: ${TABLE}."address_line_two" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: carrier_name {
    type: string
    sql: ${TABLE}."carrier_name" ;;
  }

  dimension: cat_indicator {
    type: string
    sql: ${TABLE}."cat_indicator" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: five_sigma_claim_number {
    type: string
    sql: ${TABLE}."five_sigma_claim_number" ;;
  }

  dimension: indemnity_paid_coverage_a_cents {
    type: number
    sql: ${TABLE}."indemnity_paid_coverage_a_cents" ;;
  }

  dimension: kin_claim {
    type: yesno
    sql: ${TABLE}."kin_claim" ;;
  }

  dimension: loss_category {
    type: string
    sql: ${TABLE}."loss_category" ;;
  }

  dimension_group: loss {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."loss_date" ;;
  }

  dimension: managed_repair {
    type: yesno
    sql: ${TABLE}."managed_repair" ;;
  }

  dimension: match_type {
    type: string
    sql: ${TABLE}."match_type" ;;
  }

  dimension: paid_amount_cents {
    type: number
    sql: ${TABLE}."paid_amount_cents" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_paid_amount_cents {
    type: sum
    sql: ${paid_amount_cents} ;;  }
  measure: average_paid_amount_cents {
    type: average
    sql: ${paid_amount_cents} ;;  }

  dimension: snapsheet_claim {
    type: yesno
    sql: ${TABLE}."snapsheet_claim" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
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

  dimension: uw_review_needed {
    type: yesno
    sql: ${TABLE}."uw_review_needed" ;;
  }

  dimension: verisk_carrier_claim_number {
    type: string
    sql: ${TABLE}."verisk_carrier_claim_number" ;;
  }

  dimension: weather_indicator {
    type: string
    sql: ${TABLE}."weather_indicator" ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, carrier_name, claim_payments.count, claim_sources.count]
  }
}
