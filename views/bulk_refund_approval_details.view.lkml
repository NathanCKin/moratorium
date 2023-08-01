# The name of this view in Looker is "Bulk Refund Approval Details"
view: bulk_refund_approval_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bulk_refund_approval_details ;;
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
    # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;  }
  measure: average_amount {
    type: average
    sql: ${amount} ;;  }

  dimension: bulk_refund_approval_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."bulk_refund_approval_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: check {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."check_date" ;;
  }

  dimension: check_number {
    type: string
    sql: ${TABLE}."check_number" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."due_date" ;;
  }

  dimension: log_data {
    type: string
    sql: ${TABLE}."log_data" ;;
  }

  dimension: policy_id {
    type: string
    sql: ${TABLE}."policy_id" ;;
  }

  dimension: refund_amount {
    type: number
    sql: ${TABLE}."refund_amount" ;;
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
  measure: count {
    type: count
    drill_fields: [id, bulk_refund_approvals.id]
  }
}
