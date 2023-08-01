# The name of this view in Looker is "Addresses"
view: addresses {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.addresses ;;
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
    # This dimension will be called "Census Block Group" in Explore.

  dimension: census_block_group {
    type: string
    sql: ${TABLE}."census_block_group" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: closing {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."closing_date" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }

  dimension: county_fips {
    type: string
    sql: ${TABLE}."county_fips" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: dpv_code {
    type: string
    sql: ${TABLE}."dpv_code" ;;
  }

  dimension: dpv_footnote {
    type: string
    sql: ${TABLE}."dpv_footnote" ;;
  }

  dimension: google_latlon {
    type: string
    sql: ${TABLE}."google_latlon" ;;
  }

  dimension: latlon {
    type: string
    sql: ${TABLE}."latlon" ;;
  }

  dimension: maestro {
    type: yesno
    sql: ${TABLE}."maestro" ;;
  }

  dimension: overridden_unit_number {
    type: string
    sql: ${TABLE}."overridden_unit_number" ;;
  }

  dimension: plus4_code {
    type: string
    sql: ${TABLE}."plus4_code" ;;
  }

  dimension: postdirection {
    type: string
    sql: ${TABLE}."postdirection" ;;
  }

  dimension: predirection {
    type: string
    sql: ${TABLE}."predirection" ;;
  }

  dimension: primary_number {
    type: string
    sql: ${TABLE}."primary_number" ;;
  }

  dimension: raw_street_name {
    type: string
    sql: ${TABLE}."raw_street_name" ;;
  }

  dimension: raw_unit_number {
    type: string
    sql: ${TABLE}."raw_unit_number" ;;
  }

  dimension: smarty_streets_id {
    type: number
    sql: ${TABLE}."smarty_streets_id" ;;
  }

  dimension: standardized_address {
    type: string
    sql: ${TABLE}."standardized_address" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}."street_name" ;;
  }

  dimension: street_suffix {
    type: string
    sql: ${TABLE}."street_suffix" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: timezone_name {
    type: string
    sql: ${TABLE}."timezone_name" ;;
  }

  dimension: timezone_offset {
    type: number
    sql: ${TABLE}."timezone_offset" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_timezone_offset {
    type: sum
    sql: ${timezone_offset} ;;  }
  measure: average_timezone_offset {
    type: average
    sql: ${timezone_offset} ;;  }

  dimension: unit_designator {
    type: string
    sql: ${TABLE}."unit_designator" ;;
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

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, raw_street_name, street_name, timezone_name]
  }
}
