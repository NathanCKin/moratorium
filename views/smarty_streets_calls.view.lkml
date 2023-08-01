# The name of this view in Looker is "Smarty Streets Calls"
view: smarty_streets_calls {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.smarty_streets_calls ;;
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
    # This dimension will be called "Address String" in Explore.

  dimension: address_string {
    type: string
    sql: ${TABLE}."address_string" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }

  dimension: county_fips {
    type: string
    sql: ${TABLE}."county_fips" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: latlon {
    type: string
    sql: ${TABLE}."latlon" ;;
  }

  dimension: raw_request {
    type: string
    sql: ${TABLE}."raw_request" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: request {
    type: string
    sql: ${TABLE}."request" ;;
  }

  dimension: unit_number {
    type: string
    sql: ${TABLE}."unit_number" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
