# The name of this view in Looker is "Verisk Locations"
view: verisk_locations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.verisk_locations ;;
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
    # This dimension will be called "Address ID" in Explore.

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: bceg_history {
    type: string
    sql: ${TABLE}."bceg_history" ;;
  }

  dimension: coastal_county {
    type: string
    sql: ${TABLE}."coastal_county" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: distance_to_coast {
    type: string
    sql: ${TABLE}."distance_to_coast" ;;
  }

  dimension: distance_to_coast_code {
    type: string
    sql: ${TABLE}."distance_to_coast_code" ;;
  }

  dimension: distance_to_coast_name {
    type: string
    sql: ${TABLE}."distance_to_coast_name" ;;
  }

  dimension: distance_to_fire_station {
    type: string
    sql: ${TABLE}."distance_to_fire_station" ;;
  }

  dimension: elevation {
    type: string
    sql: ${TABLE}."elevation" ;;
  }

  dimension: flood_zone {
    type: string
    sql: ${TABLE}."flood_zone" ;;
  }

  dimension: liability_territory {
    type: string
    sql: ${TABLE}."liability_territory" ;;
  }

  dimension: miles_to_actual_coast {
    type: number
    sql: ${TABLE}."miles_to_actual_coast" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_miles_to_actual_coast {
    type: sum
    sql: ${miles_to_actual_coast} ;;  }
  measure: average_miles_to_actual_coast {
    type: average
    sql: ${miles_to_actual_coast} ;;  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: protection_class {
    type: string
    sql: ${TABLE}."protection_class" ;;
  }

  dimension: responding_fire_station {
    type: string
    sql: ${TABLE}."responding_fire_station" ;;
  }

  dimension: storm_surge {
    type: string
    sql: ${TABLE}."storm_surge" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: surface_terrain {
    type: string
    sql: ${TABLE}."surface_terrain" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: windpool_eligible {
    type: string
    sql: ${TABLE}."windpool_eligible" ;;
  }

  dimension: zone_high_velocity {
    type: string
    sql: ${TABLE}."zone_high_velocity" ;;
  }

  dimension: zone_terrain {
    type: string
    sql: ${TABLE}."zone_terrain" ;;
  }

  dimension: zone_wind_debris {
    type: string
    sql: ${TABLE}."zone_wind_debris" ;;
  }

  dimension: zone_wind_speed {
    type: string
    sql: ${TABLE}."zone_wind_speed" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, distance_to_coast_name, verisk_location_raw_responses.count]
  }
}
