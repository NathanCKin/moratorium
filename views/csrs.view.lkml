# The name of this view in Looker is "Csrs"
view: csrs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.csrs ;;
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
    # This dimension will be called "Al License Number" in Explore.

  dimension: al_license_number {
    type: string
    sql: ${TABLE}."al_license_number" ;;
  }

  dimension: assignable {
    type: yesno
    sql: ${TABLE}."assignable" ;;
  }

  dimension: az_license_number {
    type: string
    sql: ${TABLE}."az_license_number" ;;
  }

  dimension: ca_license_number {
    type: string
    sql: ${TABLE}."ca_license_number" ;;
  }

  dimension: calendar_sync {
    type: yesno
    sql: ${TABLE}."calendar_sync" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: direct_number {
    type: string
    sql: ${TABLE}."direct_number" ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}."display_name" ;;
  }

  dimension: fl_license_number {
    type: string
    sql: ${TABLE}."fl_license_number" ;;
  }

  dimension: freshsales_id {
    type: string
    sql: ${TABLE}."freshsales_id" ;;
  }

  dimension: ga_license_number {
    type: string
    sql: ${TABLE}."ga_license_number" ;;
  }

  dimension: homepage {
    type: string
    sql: ${TABLE}."homepage" ;;
  }

  dimension: il_license_number {
    type: string
    sql: ${TABLE}."il_license_number" ;;
  }

  dimension: la_license_number {
    type: string
    sql: ${TABLE}."la_license_number" ;;
  }

  dimension_group: lead_requested {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."lead_requested_at" ;;
  }

  dimension: managed_by_id {
    type: number
    sql: ${TABLE}."managed_by_id" ;;
  }

  dimension: max_leads_per_day {
    type: number
    sql: ${TABLE}."max_leads_per_day" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_max_leads_per_day {
    type: sum
    sql: ${max_leads_per_day} ;;  }
  measure: average_max_leads_per_day {
    type: average
    sql: ${max_leads_per_day} ;;  }

  dimension: mi_license_number {
    type: string
    sql: ${TABLE}."mi_license_number" ;;
  }

  dimension: ms_license_number {
    type: string
    sql: ${TABLE}."ms_license_number" ;;
  }

  dimension: nj_license_number {
    type: string
    sql: ${TABLE}."nj_license_number" ;;
  }

  dimension: sc_license_number {
    type: string
    sql: ${TABLE}."sc_license_number" ;;
  }

  dimension: slack_guid {
    type: string
    sql: ${TABLE}."slack_guid" ;;
  }

  dimension: spanish_speaker {
    type: yesno
    sql: ${TABLE}."spanish_speaker" ;;
  }

  dimension: time_travel_offset_days {
    type: number
    sql: ${TABLE}."time_travel_offset_days" ;;
  }

  dimension: tx_license_number {
    type: string
    sql: ${TABLE}."tx_license_number" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }

  dimension: va_license_number {
    type: string
    sql: ${TABLE}."va_license_number" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	display_name,
	users.id,
	contact_attempts.count,
	csr_notifications.count,
	csr_quotes.count,
	tasks.count,
	twilio_faxes.count,
	twilio_sms_messages.count
	]
  }

}
