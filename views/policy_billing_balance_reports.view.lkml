# The name of this view in Looker is "Policy Billing Balance Reports"
view: policy_billing_balance_reports {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_billing_balance_reports ;;
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
    # This dimension will be called "Billing Balance Report ID" in Explore.

  dimension: billing_balance_report_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."billing_balance_report_id" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, billing_balance_reports.id]
  }
}
