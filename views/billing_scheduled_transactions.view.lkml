# The name of this view in Looker is "Billing Scheduled Transactions"
view: billing_scheduled_transactions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.billing_scheduled_transactions ;;
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
    # This dimension will be called "Accounting Premium Cents" in Explore.

  dimension: accounting_premium_cents {
    type: number
    sql: ${TABLE}."accounting_premium_cents" ;;
  }

  dimension: accounting_premium_currency {
    type: string
    sql: ${TABLE}."accounting_premium_currency" ;;
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

  dimension: amount_currency {
    type: string
    sql: ${TABLE}."amount_currency" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."approved_at" ;;
  }

  dimension: approved_by_id {
    type: number
    sql: ${TABLE}."approved_by_id" ;;
  }

  dimension: attempts {
    type: number
    sql: ${TABLE}."attempts" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: charge_response {
    type: string
    sql: ${TABLE}."charge_response" ;;
  }

  dimension_group: committed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."committed_at" ;;
  }

  dimension: confirmation {
    type: string
    sql: ${TABLE}."confirmation" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}."created_by_id" ;;
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

  dimension_group: due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."due_date" ;;
  }

  dimension: empa_fee_cents {
    type: number
    sql: ${TABLE}."empa_fee_cents" ;;
  }

  dimension: empa_fee_cents_currency {
    type: string
    sql: ${TABLE}."empa_fee_cents_currency" ;;
  }

  dimension: endorsement_request_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."endorsement_request_id" ;;
  }

  dimension: fees_currency {
    type: string
    sql: ${TABLE}."fees_currency" ;;
  }

  dimension: figa_fee_cents {
    type: number
    sql: ${TABLE}."figa_fee_cents" ;;
  }

  dimension: figa_fee_currency {
    type: string
    sql: ${TABLE}."figa_fee_currency" ;;
  }

  dimension: inspection_fee_cents {
    type: number
    sql: ${TABLE}."inspection_fee_cents" ;;
  }

  dimension: inspection_fee_cents_currency {
    type: string
    sql: ${TABLE}."inspection_fee_cents_currency" ;;
  }

  dimension: installment_fee_cents {
    type: number
    sql: ${TABLE}."installment_fee_cents" ;;
  }

  dimension: installment_fee_cents_currency {
    type: string
    sql: ${TABLE}."installment_fee_cents_currency" ;;
  }

  dimension: installment_number {
    type: number
    sql: ${TABLE}."installment_number" ;;
  }

  dimension: invoice_number {
    type: number
    sql: ${TABLE}."invoice_number" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."payment_type" ;;
  }

  dimension: program_administrator_fee_cents {
    type: number
    sql: ${TABLE}."program_administrator_fee_cents" ;;
  }

  dimension: program_administrator_fee_cents_currency {
    type: string
    sql: ${TABLE}."program_administrator_fee_cents_currency" ;;
  }

  dimension: refunded_transaction_id {
    type: number
    sql: ${TABLE}."refunded_transaction_id" ;;
  }

  dimension: refunds_payable_cents {
    type: number
    sql: ${TABLE}."refunds_payable_cents" ;;
  }

  dimension: refunds_payable_currency {
    type: string
    sql: ${TABLE}."refunds_payable_currency" ;;
  }

  dimension: renewal_endorsement_request_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."renewal_endorsement_request_id" ;;
  }

  dimension: state_tax_1_cents {
    type: number
    sql: ${TABLE}."state_tax_1_cents" ;;
  }

  dimension: state_tax_1_currency {
    type: string
    sql: ${TABLE}."state_tax_1_currency" ;;
  }

  dimension: state_tax_2_cents {
    type: number
    sql: ${TABLE}."state_tax_2_cents" ;;
  }

  dimension: state_tax_2_currency {
    type: string
    sql: ${TABLE}."state_tax_2_currency" ;;
  }

  dimension: state_tax_3_cents {
    type: number
    sql: ${TABLE}."state_tax_3_cents" ;;
  }

  dimension: state_tax_3_currency {
    type: string
    sql: ${TABLE}."state_tax_3_currency" ;;
  }

  dimension: state_tax_cents {
    type: number
    sql: ${TABLE}."state_tax_cents" ;;
  }

  dimension: state_tax_currency {
    type: string
    sql: ${TABLE}."state_tax_currency" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: surplus_cents {
    type: number
    sql: ${TABLE}."surplus_cents" ;;
  }

  dimension: surplus_currency {
    type: string
    sql: ${TABLE}."surplus_currency" ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}."term" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, endorsement_requests.id, renewal_endorsement_requests.id]
  }
}
