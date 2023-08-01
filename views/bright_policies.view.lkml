# The name of this view in Looker is "Bright Policies"
view: bright_policies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bright_policies ;;
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
    # This dimension will be called "Aggregate Root ID" in Explore.

  dimension: aggregate_root_id {
    type: string
    sql: ${TABLE}."aggregate_root_id" ;;
  }

  dimension: billing_method_id {
    type: number
    sql: ${TABLE}."billing_method_id" ;;
  }

  dimension: billing_method_type {
    type: string
    sql: ${TABLE}."billing_method_type" ;;
  }

  dimension: bind_category {
    type: string
    sql: ${TABLE}."bind_category" ;;
  }

  dimension: coverage_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."coverage_id" ;;
  }

  dimension: coverage_version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."coverage_version_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: custom_quote_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."custom_quote_id" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: frozen_insurance_score {
    type: number
    sql: ${TABLE}."frozen_insurance_score" ;;
  }

  dimension: frozen_rating_id {
    type: number
    sql: ${TABLE}."frozen_rating_id" ;;
  }

  dimension: full_policy_number {
    type: string
    sql: ${TABLE}."full_policy_number" ;;
  }

  dimension: inspection_type {
    type: string
    sql: ${TABLE}."inspection_type" ;;
  }

  dimension: payment_schedule {
    type: string
    sql: ${TABLE}."payment_schedule" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."payment_type" ;;
  }

  dimension: policy_number_prefix {
    type: string
    sql: ${TABLE}."policy_number_prefix" ;;
  }

  dimension: policy_number_suffix {
    type: number
    sql: ${TABLE}."policy_number_suffix" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_policy_number_suffix {
    type: sum
    sql: ${policy_number_suffix} ;;  }
  measure: average_policy_number_suffix {
    type: average
    sql: ${policy_number_suffix} ;;  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: property_version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."property_version_id" ;;
  }

  dimension: renewal_flag_set_by_id {
    type: number
    sql: ${TABLE}."renewal_flag_set_by_id" ;;
  }

  dimension: renewal_status {
    type: string
    sql: ${TABLE}."renewal_status" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	custom_quotes.name,
	custom_quotes.id,
	coverages.id,
	coverage_versions.id,
	products.id,
	property_versions.id
	]
  }

}
