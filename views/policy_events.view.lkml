# The name of this view in Looker is "Policy Events"
view: policy_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_events ;;
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
    # This dimension will be called "Bright Policy ID" in Explore.

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: changeset {
    type: string
    sql: ${TABLE}."changeset" ;;
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

  dimension: early_terminated_snapshot_id {
    type: number
    sql: ${TABLE}."early_terminated_snapshot_id" ;;
  }

  dimension: effective_policy_snapshot_ids {
    type: string
    # hidden: yes
    sql: ${TABLE}."effective_policy_snapshot_ids" ;;
  }

  dimension: frozen_claims {
    type: string
    sql: ${TABLE}."frozen_claims" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: old_coverage_new_flood_rates {
    type: number
    sql: ${TABLE}."old_coverage_new_flood_rates" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_old_coverage_new_flood_rates {
    type: sum
    sql: ${old_coverage_new_flood_rates} ;;  }
  measure: average_old_coverage_new_flood_rates {
    type: average
    sql: ${old_coverage_new_flood_rates} ;;  }

  dimension: old_coverage_new_rates {
    type: number
    sql: ${TABLE}."old_coverage_new_rates" ;;
  }

  dimension: old_coverage_old_flood_rates {
    type: number
    sql: ${TABLE}."old_coverage_old_flood_rates" ;;
  }

  dimension: old_coverage_old_rates {
    type: number
    sql: ${TABLE}."old_coverage_old_rates" ;;
  }

  dimension: prior_rating_id {
    type: number
    sql: ${TABLE}."prior_rating_id" ;;
  }

  dimension: rating_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."rating_id" ;;
  }

  dimension: reason_for_cancellation {
    type: string
    sql: ${TABLE}."reason_for_cancellation" ;;
  }

  dimension: repairs_allowed {
    type: yesno
    sql: ${TABLE}."repairs_allowed" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: supplemental_event_data {
    type: string
    sql: ${TABLE}."supplemental_event_data" ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."transaction_date" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
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
	effective_policy_snapshots.id,
	ratings.id,
	accounting_metadata.count,
	cancellation_metadata.count,
	effective_policy_snapshots.count,
	policy_event_reasons.count,
	policy_job_runs.count
	]
  }

}
