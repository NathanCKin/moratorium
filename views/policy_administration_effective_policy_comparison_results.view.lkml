# The name of this view in Looker is "Policy Administration Effective Policy Comparison Results"
view: policy_administration_effective_policy_comparison_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_administration_effective_policy_comparison_results ;;
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
    # This dimension will be called "Coverage Match" in Explore.

  dimension: coverage_match {
    type: yesno
    sql: ${TABLE}."coverage_match" ;;
  }

  dimension: coverage_mismatches {
    type: string
    sql: ${TABLE}."coverage_mismatches" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: effective_policy_id {
    type: string
    sql: ${TABLE}."effective_policy_id" ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date" ;;
  }

  dimension: policy_id {
    type: number
    sql: ${TABLE}."policy_id" ;;
  }

  dimension: property_match {
    type: yesno
    sql: ${TABLE}."property_match" ;;
  }

  dimension: property_mismatches {
    type: string
    sql: ${TABLE}."property_mismatches" ;;
  }

  dimension: rating_match {
    type: yesno
    sql: ${TABLE}."rating_match" ;;
  }

  dimension: rating_mismatches {
    type: string
    sql: ${TABLE}."rating_mismatches" ;;
  }

  dimension: snapshot_id {
    type: number
    sql: ${TABLE}."snapshot_id" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date" ;;
  }

  dimension: status_match {
    type: yesno
    sql: ${TABLE}."status_match" ;;
  }

  dimension: status_mismatches {
    type: string
    sql: ${TABLE}."status_mismatches" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
