# The name of this view in Looker is "Velocity Claims"
view: velocity_claims {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.velocity_claims ;;
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
    # This dimension will be called "Agency Number" in Explore.

  dimension: agency_number {
    type: string
    sql: ${TABLE}."agency_number" ;;
  }

  dimension: cause_code_desc {
    type: string
    sql: ${TABLE}."cause_code_desc" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: claim_closed {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."claim_closed_date" ;;
  }

  dimension_group: claim_reopened {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."claim_reopened_date" ;;
  }

  dimension: claim_status {
    type: string
    sql: ${TABLE}."claim_status" ;;
  }

  dimension: claimant_name {
    type: string
    sql: ${TABLE}."claimant_name" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: date_of_loss {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date_of_loss" ;;
  }

  dimension: direct_repair_program {
    type: yesno
    sql: ${TABLE}."direct_repair_program" ;;
  }

  dimension: event_desc {
    type: string
    sql: ${TABLE}."event_desc" ;;
  }

  dimension: examiner_email {
    type: string
    sql: ${TABLE}."examiner_email" ;;
  }

  dimension: examiner_name {
    type: string
    sql: ${TABLE}."examiner_name" ;;
  }

  dimension: examiner_phone {
    type: string
    sql: ${TABLE}."examiner_phone" ;;
  }

  dimension: file_number {
    type: string
    sql: ${TABLE}."file_number" ;;
  }

  dimension_group: fnol {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."fnol_date" ;;
  }

  dimension: kin_number {
    type: string
    sql: ${TABLE}."kin_number" ;;
  }

  dimension: policy_last_six {
    type: string
    sql: ${TABLE}."policy_last_six" ;;
  }

  dimension: supervisor_name {
    type: string
    sql: ${TABLE}."supervisor_name" ;;
  }

  dimension: total_incurred {
    type: number
    sql: ${TABLE}."total_incurred" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_incurred {
    type: sum
    sql: ${total_incurred} ;;  }
  measure: average_total_incurred {
    type: average
    sql: ${total_incurred} ;;  }

  dimension: total_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."total_paid" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, examiner_name, supervisor_name, claimant_name]
  }
}
