# The name of this view in Looker is "Referrals"
view: referrals {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.referrals ;;
  drill_fields: [referral_identifier]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: referral_identifier {
    primary_key: yes
    type: string
    sql: ${TABLE}."referral_identifier" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Converted" in Explore.

  dimension: converted {
    type: yesno
    sql: ${TABLE}."converted" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: customer_input_response_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."customer_input_response_id" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}."platform" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [referral_identifier, customer_input_responses.id]
  }
}
