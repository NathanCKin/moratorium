# The name of this view in Looker is "Hazard Hub Plus Locations"
view: hazard_hub_plus_locations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.hazard_hub_plus_locations ;;
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
    # This dimension will be called "Aais Fire Protection Class" in Explore.

  dimension: aais_fire_protection_class {
    type: string
    sql: ${TABLE}."aais_fire_protection_class" ;;
  }

  dimension: aais_fire_protection_proxy {
    type: string
    sql: ${TABLE}."aais_fire_protection_proxy" ;;
  }

  dimension: acreage {
    type: number
    sql: ${TABLE}."acreage" ;;
  }

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: bathrooms {
    type: number
    sql: ${TABLE}."bathrooms" ;;
  }

  dimension: census_block_group {
    type: string
    sql: ${TABLE}."census_block_group" ;;
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

  dimension: distance_to_actual_coast_feet {
    type: number
    sql: ${TABLE}."distance_to_actual_coast_feet" ;;
  }

  dimension: distance_to_coast {
    type: string
    sql: ${TABLE}."distance_to_coast" ;;
  }

  dimension: feet_from_fire_dept {
    type: number
    sql: ${TABLE}."feet_from_fire_dept" ;;
  }

  dimension: feet_range_from_hydrant {
    type: string
    sql: ${TABLE}."feet_range_from_hydrant" ;;
  }

  dimension: flood_zone {
    type: string
    sql: ${TABLE}."flood_zone" ;;
  }

  dimension: garage_code {
    type: string
    sql: ${TABLE}."garage_code" ;;
  }

  dimension: latlon {
    type: string
    sql: ${TABLE}."latlon" ;;
  }

  dimension: less_than_1000_ft_from_water {
    type: yesno
    sql: ${TABLE}."less_than_1000_ft_from_water" ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}."location_type" ;;
  }

  dimension: owner_occupied {
    type: string
    sql: ${TABLE}."owner_occupied" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension_group: sale {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."sale_date" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."sale_price" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;  }
  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;  }

  dimension: slope {
    type: number
    sql: ${TABLE}."slope" ;;
  }

  dimension: sq_ft {
    type: number
    sql: ${TABLE}."sq_ft" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
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

  dimension: wildfire_grade {
    type: string
    sql: ${TABLE}."wildfire_grade" ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}."year_built" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
