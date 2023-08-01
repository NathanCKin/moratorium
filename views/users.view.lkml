# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.users ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: current_sign_in {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."current_sign_in_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Current Sign In IP" in Explore.

  dimension: current_sign_in_ip {
    type: string
    sql: ${TABLE}."current_sign_in_ip" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}."encrypted_password" ;;
  }

  dimension: failed_attempts {
    type: number
    sql: ${TABLE}."failed_attempts" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_failed_attempts {
    type: sum
    sql: ${failed_attempts} ;;  }
  measure: average_failed_attempts {
    type: average
    sql: ${failed_attempts} ;;  }

  dimension: freshsales_id {
    type: string
    sql: ${TABLE}."freshsales_id" ;;
  }

  dimension: google_refresh_token {
    type: string
    sql: ${TABLE}."google_refresh_token" ;;
  }

  dimension: google_token {
    type: string
    sql: ${TABLE}."google_token" ;;
  }

  dimension: has_visited_funnel {
    type: yesno
    sql: ${TABLE}."has_visited_funnel" ;;
  }

  dimension: invalidation_count {
    type: number
    sql: ${TABLE}."invalidation_count" ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}."language" ;;
  }

  dimension_group: last_sign_in {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."last_sign_in_at" ;;
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}."last_sign_in_ip" ;;
  }

  dimension_group: locked {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."locked_at" ;;
  }

  dimension: partner_opt_in {
    type: yesno
    sql: ${TABLE}."partner_opt_in" ;;
  }

  dimension_group: remember_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."remember_created_at" ;;
  }

  dimension: remember_token {
    type: string
    sql: ${TABLE}."remember_token" ;;
  }

  dimension_group: reset_password_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."reset_password_sent_at" ;;
  }

  dimension: reset_password_token {
    type: string
    sql: ${TABLE}."reset_password_token" ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}."sign_in_count" ;;
  }

  dimension_group: signing_token_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."signing_token_sent_at" ;;
  }

  dimension: unlock_token {
    type: string
    sql: ${TABLE}."unlock_token" ;;
  }

  dimension: unsubscribed {
    type: yesno
    sql: ${TABLE}."unsubscribed" ;;
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
	consents.count,
	csrs.count,
	customer_io_api_interactions.count,
	intake_tokens.count,
	kustomer_people.count,
	kustomer_users.count,
	people.count,
	pg_stat_statements.count,
	plutus_entries.count,
	underwriting_decisions.count,
	users_roles.count
	]
  }

}
