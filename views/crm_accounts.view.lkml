# The name of this view in Looker is "Crm Accounts"
view: crm_accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.crm_accounts ;;
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
    # This dimension will be called "Heard About Us" in Explore.

  dimension: heard_about_us {
    type: string
    sql: ${TABLE}."heard_about_us" ;;
  }

  dimension: hot {
    type: yesno
    sql: ${TABLE}."hot" ;;
  }

  dimension: lost_details {
    type: string
    sql: ${TABLE}."lost_details" ;;
  }

  dimension: lost_details_response {
    type: string
    sql: ${TABLE}."lost_details_response" ;;
  }

  dimension: lost_reason {
    type: string
    sql: ${TABLE}."lost_reason" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	contact_attempts.count,
	crm_assignments.count,
	five_nine_calls.count,
	kustomer_crm_assignments.count,
	kustomer_people.count,
	people.count
	]
  }

}
