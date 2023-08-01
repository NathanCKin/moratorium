# The name of this view in Looker is "Kustomer Users"
view: kustomer_users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.kustomer_users ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
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

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
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

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [users.id]
  }
}
