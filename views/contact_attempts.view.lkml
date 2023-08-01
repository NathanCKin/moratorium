# The name of this view in Looker is "Contact Attempts"
view: contact_attempts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.contact_attempts ;;
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

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Crm Account ID" in Explore.

  dimension: crm_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."crm_account_id" ;;
  }

  dimension: csr_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."csr_id" ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."event_type" ;;
  }

  dimension: five_nine_call_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."five_nine_call_id" ;;
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
	csrs.display_name,
	csrs.id,
	five_nine_calls.agent_name,
	five_nine_calls.id,
	five_nine_calls.name,
	five_nine_calls.user_name,
	five_nine_calls.last_name,
	five_nine_calls.disposition_name,
	five_nine_calls.first_name,
	five_nine_calls.skill_name,
	five_nine_calls.campaign_name,
	five_nine_calls.full_name,
	five_nine_calls.type_name,
	five_nine_calls.domain_name,
	crm_accounts.id
	]
  }

}
