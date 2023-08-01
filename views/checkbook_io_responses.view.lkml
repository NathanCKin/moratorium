# The name of this view in Looker is "Checkbook Io Responses"
view: checkbook_io_responses {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.checkbook_io_responses ;;
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
    # This dimension will be called "Amount Cents" in Explore.

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

  dimension: amount_currency {
    type: string
    sql: ${TABLE}."amount_currency" ;;
  }

  dimension: check_image_uri {
    type: string
    sql: ${TABLE}."check_image_uri" ;;
  }

  dimension: check_number {
    type: string
    sql: ${TABLE}."check_number" ;;
  }

  dimension: check_status {
    type: string
    sql: ${TABLE}."check_status" ;;
  }

  dimension: checkbook_io_id {
    type: string
    sql: ${TABLE}."checkbook_io_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date" ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: recipient_email {
    type: string
    sql: ${TABLE}."recipient_email" ;;
  }

  dimension: refund_id {
    type: number
    sql: ${TABLE}."refund_id" ;;
  }

  dimension: remittance_advice {
    type: string
    sql: ${TABLE}."remittance_advice" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
