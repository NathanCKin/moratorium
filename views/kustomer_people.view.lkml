# The name of this view in Looker is "Kustomer People"
view: kustomer_people {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.kustomer_people ;;
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
    # This dimension will be called "Address ID" in Explore.

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: banned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."banned_at" ;;
  }

  dimension: banned_reason {
    type: string
    sql: ${TABLE}."banned_reason" ;;
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

  dimension: crm_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."crm_account_id" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension_group: dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dob" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: kustomer_id {
    type: string
    sql: ${TABLE}."kustomer_id" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}."middle_name" ;;
  }

  dimension: ofac_sanctioned_match_id {
    type: number
    sql: ${TABLE}."ofac_sanctioned_match_id" ;;
  }

  dimension_group: opt_out_call {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."opt_out_call_at" ;;
  }

  dimension_group: opt_out_email {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."opt_out_email_at" ;;
  }

  dimension_group: opt_out_text {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."opt_out_text_at" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone_number" ;;
  }

  dimension: prior_address_id {
    type: number
    sql: ${TABLE}."prior_address_id" ;;
  }

  dimension: promo_code_file_import_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."promo_code_file_import_id" ;;
  }

  dimension: random_number {
    type: number
    sql: ${TABLE}."random_number" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_random_number {
    type: sum
    sql: ${random_number} ;;  }
  measure: average_random_number {
    type: average
    sql: ${random_number} ;;  }

  dimension_group: subscriber_agreement_signed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."subscriber_agreement_signed_at" ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}."suffix" ;;
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
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	middle_name,
	last_name,
	first_name,
	crm_accounts.id,
	promo_code_file_imports.id,
	users.id
	]
  }

}
