# The name of this view in Looker is "Event Reasons"
view: event_reasons {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.event_reasons ;;
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
    # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }

  dimension: display_reason {
    type: string
    sql: ${TABLE}."display_reason" ;;
  }

  dimension: insurance_reason_code {
    type: string
    sql: ${TABLE}."insurance_reason_code" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."is_active" ;;
  }

  dimension: valid_for_cancellation {
    type: yesno
    sql: ${TABLE}."valid_for_cancellation" ;;
  }

  dimension: valid_for_custom_input {
    type: yesno
    sql: ${TABLE}."valid_for_custom_input" ;;
  }

  dimension: valid_for_good_faith_renewal {
    type: yesno
    sql: ${TABLE}."valid_for_good_faith_renewal" ;;
  }

  dimension: valid_for_non_renewal {
    type: yesno
    sql: ${TABLE}."valid_for_non_renewal" ;;
  }

  dimension: valid_for_review_before_renewal {
    type: yesno
    sql: ${TABLE}."valid_for_review_before_renewal" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, policy_event_reasons.count]
  }
}
