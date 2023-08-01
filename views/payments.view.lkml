# The name of this view in Looker is "Payments"
view: payments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.payments ;;
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
    # This dimension will be called "Bank Name" in Explore.

  dimension: bank_name {
    type: string
    sql: ${TABLE}."bank_name" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: dated_on {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dated_on" ;;
  }

  dimension_group: deposited {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."deposited_on" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."external_id" ;;
  }

  dimension: lockbox_reference {
    type: string
    sql: ${TABLE}."lockbox_reference" ;;
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

  dimension: payor_id {
    type: number
    sql: ${TABLE}."payor_id" ;;
  }

  dimension: scheduled_transaction_id {
    type: number
    sql: ${TABLE}."scheduled_transaction_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, bank_name, payment_methods.id]
  }
}
