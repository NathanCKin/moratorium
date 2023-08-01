# The name of this view in Looker is "Verisk Valuations"
view: verisk_valuations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.verisk_valuations ;;
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
    # This dimension will be called "Actual Cash Value" in Explore.

  dimension: actual_cash_value {
    type: string
    sql: ${TABLE}."actual_cash_value" ;;
  }

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: construction_year {
    type: string
    sql: ${TABLE}."construction_year" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: detached_structures_value {
    type: string
    sql: ${TABLE}."detached_structures_value" ;;
  }

  dimension: exterior_wall_construction_code {
    type: string
    sql: ${TABLE}."exterior_wall_construction_code" ;;
  }

  dimension: exterior_wall_construction_data {
    type: string
    sql: ${TABLE}."exterior_wall_construction_data" ;;
  }

  dimension: exterior_wall_finish_code {
    type: string
    sql: ${TABLE}."exterior_wall_finish_code" ;;
  }

  dimension: exterior_wall_finish_data {
    type: string
    sql: ${TABLE}."exterior_wall_finish_data" ;;
  }

  dimension: foundation_percentage {
    type: number
    sql: ${TABLE}."foundation_percentage" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_foundation_percentage {
    type: sum
    sql: ${foundation_percentage} ;;  }
  measure: average_foundation_percentage {
    type: average
    sql: ${foundation_percentage} ;;  }

  dimension: foundation_percentage_data {
    type: string
    sql: ${TABLE}."foundation_percentage_data" ;;
  }

  dimension: foundation_shape {
    type: string
    sql: ${TABLE}."foundation_shape" ;;
  }

  dimension: foundation_shape_data {
    type: string
    sql: ${TABLE}."foundation_shape_data" ;;
  }

  dimension: foundation_type_code {
    type: string
    sql: ${TABLE}."foundation_type_code" ;;
  }

  dimension: foundation_type_data {
    type: string
    sql: ${TABLE}."foundation_type_data" ;;
  }

  dimension: full_bathrooms {
    type: number
    sql: ${TABLE}."full_bathrooms" ;;
  }

  dimension: garage_cars {
    type: string
    sql: ${TABLE}."garage_cars" ;;
  }

  dimension: garage_style {
    type: string
    sql: ${TABLE}."garage_style" ;;
  }

  dimension: half_bathrooms {
    type: number
    sql: ${TABLE}."half_bathrooms" ;;
  }

  dimension: kin_property_type {
    type: string
    sql: ${TABLE}."kin_property_type" ;;
  }

  dimension: one_and_a_half_bathrooms {
    type: number
    sql: ${TABLE}."one_and_a_half_bathrooms" ;;
  }

  dimension: pool_value {
    type: string
    sql: ${TABLE}."pool_value" ;;
  }

  dimension: property_type {
    type: string
    sql: ${TABLE}."property_type" ;;
  }

  dimension: quality {
    type: string
    sql: ${TABLE}."quality" ;;
  }

  dimension: quality_data {
    type: string
    sql: ${TABLE}."quality_data" ;;
  }

  dimension: replacement_cost {
    type: string
    sql: ${TABLE}."replacement_cost" ;;
  }

  dimension: roof_cover_code {
    type: string
    sql: ${TABLE}."roof_cover_code" ;;
  }

  dimension: roof_cover_data {
    type: string
    sql: ${TABLE}."roof_cover_data" ;;
  }

  dimension: roof_shape_code {
    type: string
    sql: ${TABLE}."roof_shape_code" ;;
  }

  dimension: roof_shape_data {
    type: string
    sql: ${TABLE}."roof_shape_data" ;;
  }

  dimension: sq_ft {
    type: number
    sql: ${TABLE}."sq_ft" ;;
  }

  dimension: sqft_data {
    type: string
    sql: ${TABLE}."sqft_data" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
  }

  dimension: stories_data {
    type: string
    sql: ${TABLE}."stories_data" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: usage {
    type: string
    sql: ${TABLE}."usage" ;;
  }

  dimension: valuation_id {
    type: string
    sql: ${TABLE}."valuation_id" ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}."year_built" ;;
  }

  dimension: year_built_data {
    type: string
    sql: ${TABLE}."year_built_data" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, verisk_valuation_raw_responses.count]
  }
}
