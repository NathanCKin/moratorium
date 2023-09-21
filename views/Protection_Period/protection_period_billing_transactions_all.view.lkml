
view: protection_period_billing_transactions_all {
  derived_table: {
    sql:
      select bst.bright_policy_id
      , bst.id as billing_transaction_id
      , bst.term as billing_transaction_term
      , bst.installment_number as billing_installment_number
      , bst.due_date as billing_transaction_due_date
      , bst.status as billing_transaction_status
      , bst.payment_type as billing_transaction_payment_type
      , (cast(bst.amount_cents as decimal(12,4))/100) as billing_transaction_amount
      from        dotcom.billing_scheduled_transactions as bst
      inner join  ${protection_period_policies.SQL_TABLE_NAME} as bp
      on bst.bright_policy_id = bp.bright_policy_id
      where 1=1
      and bst.deleted_at is null
      --and bst.due_date > '2023-08-22' and bst.status = 'upcoming' and bst.payment_type = 'scheduled'
      --and bst.due_date BETWEEN bp.protection_period_starts_at and (bp.protection_period_ends_at + INTERVAL '17 days')
      --order by bst.bright_policy_id, bst.due_date
      ;;
    persist_for: "6 hours"
    distribution_style:  all
  }

  dimension: bright_policy_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.bright_policy_id ;;
    link: {
      label: "Kinfo"
      url:"https://app.kin.com/kintranet/accounting_details/{{value}}"
      icon_url: "https://www.kin.com/build/images/logos/kin-primary.svg"
    }
  }

  dimension: billing_transaction_id {
    type: number
    sql: ${TABLE}.billing_transaction_id ;;
  }

  dimension: billing_transaction_term {
    type: number
    sql: ${TABLE}.billing_transaction_term ;;
  }

  dimension: billing_installment_number {
    type: number
    sql: ${TABLE}.billing_installment_number ;;
  }

  dimension: billing_transaction_due_date {
    type: date
    convert_tz: no
    sql: ${TABLE}.billing_transaction_due_date ;;
  }

  dimension: billing_transaction_status {
    type: string
    sql: ${TABLE}.billing_transaction_status ;;
  }

  dimension: billing_transaction_payment_type {
    type: string
    sql: ${TABLE}.billing_transaction_payment_type ;;
  }

  dimension: billing_transaction_amount {
    type: number
    sql: ${TABLE}.billing_transaction_amount ;;
  }

  set: detail {
    fields: [
  bright_policy_id,
  billing_transaction_id,
  billing_transaction_term,
  billing_installment_number,
  billing_transaction_due_date,
  billing_transaction_status,
  billing_transaction_payment_type,
  billing_transaction_amount
    ]
  }
}
