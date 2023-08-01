# The name of this view in Looker is "Click Leads"
view: click_leads {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.click_leads ;;
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
    # This dimension will be called "Click ID" in Explore.

  dimension: click_id {
    type: string
    sql: ${TABLE}."click_id" ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: raw_address {
    type: string
    sql: ${TABLE}."raw_address" ;;
  }

  dimension: raw_email {
    type: string
    sql: ${TABLE}."raw_email" ;;
  }

  dimension: raw_phone {
    type: string
    sql: ${TABLE}."raw_phone" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, customer_input_responses.id]
  }
}
