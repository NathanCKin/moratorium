# The name of this view in Looker is "Properties"
view: properties {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.properties ;;
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
    # This dimension will be called "Acreage" in Explore.

  dimension: acreage {
    type: number
    sql: ${TABLE}."acreage" ;;
  }

  dimension: actual_cash_value {
    type: number
    sql: ${TABLE}."actual_cash_value" ;;
  }

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: ansi_compliance {
    type: string
    sql: ${TABLE}."ansi_compliance" ;;
  }

  dimension: bathrooms {
    type: number
    sql: ${TABLE}."bathrooms" ;;
  }

  dimension: bceg {
    type: string
    sql: ${TABLE}."bceg" ;;
  }

  dimension: bceg_history {
    type: string
    sql: ${TABLE}."bceg_history" ;;
  }

  dimension: bedrooms {
    type: number
    sql: ${TABLE}."bedrooms" ;;
  }

  dimension: builder {
    type: string
    sql: ${TABLE}."builder" ;;
  }

  dimension: building_code_compliance {
    type: string
    sql: ${TABLE}."building_code_compliance" ;;
  }

  dimension: burglar_alarm {
    type: string
    sql: ${TABLE}."burglar_alarm" ;;
  }

  dimension: business_on_premise {
    type: string
    sql: ${TABLE}."business_on_premise" ;;
  }

  dimension: census_block_value_percentile_max {
    type: number
    sql: ${TABLE}."census_block_value_percentile_max" ;;
  }

  dimension: census_block_value_percentile_min {
    type: number
    sql: ${TABLE}."census_block_value_percentile_min" ;;
  }

  dimension: construction_type {
    type: string
    sql: ${TABLE}."construction_type" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: deadbolt {
    type: string
    sql: ${TABLE}."deadbolt" ;;
  }

  dimension: distance_to_actual_coast_feet {
    type: number
    sql: ${TABLE}."distance_to_actual_coast_feet" ;;
  }

  dimension: dog_breed_completed_cgc {
    type: string
    sql: ${TABLE}."dog_breed_completed_cgc" ;;
  }

  dimension: dog_breed_in_restricted_list {
    type: string
    sql: ${TABLE}."dog_breed_in_restricted_list" ;;
  }

  dimension: dog_breed_is_exclusionable {
    type: string
    sql: ${TABLE}."dog_breed_is_exclusionable" ;;
  }

  dimension: exterior_wall_construction {
    type: string
    sql: ${TABLE}."exterior_wall_construction" ;;
  }

  dimension: exterior_wall_finish {
    type: string
    sql: ${TABLE}."exterior_wall_finish" ;;
  }

  dimension: farm_exposure {
    type: string
    sql: ${TABLE}."farm_exposure" ;;
  }

  dimension: fbc_wind_speed {
    type: string
    sql: ${TABLE}."fbc_wind_speed" ;;
  }

  dimension: feet_from_fire_dept {
    type: number
    sql: ${TABLE}."feet_from_fire_dept" ;;
  }

  dimension: feet_from_hydrant_max {
    type: number
    sql: ${TABLE}."feet_from_hydrant_max" ;;
  }

  dimension: feet_from_hydrant_min {
    type: number
    sql: ${TABLE}."feet_from_hydrant_min" ;;
  }

  dimension: feet_to_coast_max {
    type: number
    sql: ${TABLE}."feet_to_coast_max" ;;
  }

  dimension: feet_to_coast_min {
    type: number
    sql: ${TABLE}."feet_to_coast_min" ;;
  }

  dimension: fire_alarm_monitoring {
    type: string
    sql: ${TABLE}."fire_alarm_monitoring" ;;
  }

  dimension: fire_alarm_sprinkler {
    type: string
    sql: ${TABLE}."fire_alarm_sprinkler" ;;
  }

  dimension: fire_extinguisher {
    type: string
    sql: ${TABLE}."fire_extinguisher" ;;
  }

  dimension: fire_protective_device {
    type: string
    sql: ${TABLE}."fire_protective_device" ;;
  }

  dimension: flood_zone {
    type: string
    sql: ${TABLE}."flood_zone" ;;
  }

  dimension: formation {
    type: string
    sql: ${TABLE}."formation" ;;
  }

  dimension: foundation {
    type: string
    sql: ${TABLE}."foundation" ;;
  }

  dimension: foundation_shape {
    type: string
    sql: ${TABLE}."foundation_shape" ;;
  }

  dimension: freshsales_id {
    type: string
    sql: ${TABLE}."freshsales_id" ;;
  }

  dimension: hail_resistant_roof {
    type: string
    sql: ${TABLE}."hail_resistant_roof" ;;
  }

  dimension: has_detached_garage {
    type: string
    sql: ${TABLE}."has_detached_garage" ;;
  }

  dimension: historical_home {
    type: string
    sql: ${TABLE}."historical_home" ;;
  }

  dimension: ibhs_designation {
    type: string
    sql: ${TABLE}."ibhs_designation" ;;
  }

  dimension: in_association {
    type: string
    sql: ${TABLE}."in_association" ;;
  }

  dimension: inspection_company {
    type: string
    sql: ${TABLE}."inspection_company" ;;
  }

  dimension_group: inspection {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."inspection_date" ;;
  }

  dimension: last_funnel_step {
    type: string
    sql: ${TABLE}."last_funnel_step" ;;
  }

  dimension: leed_certified {
    type: string
    sql: ${TABLE}."leed_certified" ;;
  }

  dimension: less_than1000_ft_from_water {
    type: string
    sql: ${TABLE}."less_than1000_ft_from_water" ;;
  }

  dimension: located_over_water {
    type: string
    sql: ${TABLE}."located_over_water" ;;
  }

  dimension: modern_building_code {
    type: string
    sql: ${TABLE}."modern_building_code" ;;
  }

  dimension: months_occupied {
    type: number
    sql: ${TABLE}."months_occupied" ;;
  }

  dimension: number_of_families {
    type: number
    sql: ${TABLE}."number_of_families" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_families {
    type: sum
    sql: ${number_of_families} ;;  }
  measure: average_number_of_families {
    type: average
    sql: ${number_of_families} ;;  }

  dimension: opening_protection {
    type: string
    sql: ${TABLE}."opening_protection" ;;
  }

  dimension: overall_quality {
    type: string
    sql: ${TABLE}."overall_quality" ;;
  }

  dimension: pas_enabled {
    type: yesno
    sql: ${TABLE}."pas_enabled" ;;
  }

  dimension: pool {
    type: string
    sql: ${TABLE}."pool" ;;
  }

  dimension: pool_enclosure {
    type: yesno
    sql: ${TABLE}."pool_enclosure" ;;
  }

  dimension: property_type {
    type: string
    sql: ${TABLE}."property_type" ;;
  }

  dimension: protection_class {
    type: string
    sql: ${TABLE}."protection_class" ;;
  }

  dimension_group: purchase {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."purchase_date" ;;
  }

  dimension: renovation_year_electrical {
    type: number
    sql: ${TABLE}."renovation_year_electrical" ;;
  }

  dimension: renovation_year_heating {
    type: number
    sql: ${TABLE}."renovation_year_heating" ;;
  }

  dimension: renovation_year_plumbing {
    type: number
    sql: ${TABLE}."renovation_year_plumbing" ;;
  }

  dimension: renovation_year_water_heater {
    type: number
    sql: ${TABLE}."renovation_year_water_heater" ;;
  }

  dimension: rental_to_others {
    type: string
    sql: ${TABLE}."rental_to_others" ;;
  }

  dimension: repair_condition {
    type: string
    sql: ${TABLE}."repair_condition" ;;
  }

  dimension: replacement_cost {
    type: number
    sql: ${TABLE}."replacement_cost" ;;
  }

  dimension: residence_type {
    type: string
    sql: ${TABLE}."residence_type" ;;
  }

  dimension: roof_condition {
    type: string
    sql: ${TABLE}."roof_condition" ;;
  }

  dimension: roof_condition_rating {
    type: string
    sql: ${TABLE}."roof_condition_rating" ;;
  }

  dimension: roof_construction_year {
    type: number
    sql: ${TABLE}."roof_construction_year" ;;
  }

  dimension: roof_cover {
    type: string
    sql: ${TABLE}."roof_cover" ;;
  }

  dimension: roof_deck {
    type: string
    sql: ${TABLE}."roof_deck" ;;
  }

  dimension: roof_deck_attachment {
    type: string
    sql: ${TABLE}."roof_deck_attachment" ;;
  }

  dimension_group: roof_life_expectancy {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."roof_life_expectancy" ;;
  }

  dimension_group: roof_permit {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."roof_permit_date" ;;
  }

  dimension_group: roof_rating_capture {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."roof_rating_capture_date" ;;
  }

  dimension: roof_shape {
    type: string
    sql: ${TABLE}."roof_shape" ;;
  }

  dimension: roof_solar_panels {
    type: yesno
    sql: ${TABLE}."roof_solar_panels" ;;
  }

  dimension: roof_type {
    type: string
    sql: ${TABLE}."roof_type" ;;
  }

  dimension: roof_wall_connection {
    type: string
    sql: ${TABLE}."roof_wall_connection" ;;
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

  dimension: secondary_water_resistance {
    type: string
    sql: ${TABLE}."secondary_water_resistance" ;;
  }

  dimension: secured_community {
    type: string
    sql: ${TABLE}."secured_community" ;;
  }

  dimension: security_bars {
    type: string
    sql: ${TABLE}."security_bars" ;;
  }

  dimension: short_sale_or_foreclosure {
    type: string
    sql: ${TABLE}."short_sale_or_foreclosure" ;;
  }

  dimension: slope {
    type: number
    sql: ${TABLE}."slope" ;;
  }

  dimension: smoke_alarm {
    type: string
    sql: ${TABLE}."smoke_alarm" ;;
  }

  dimension: special_hazard_interface_area {
    type: string
    sql: ${TABLE}."special_hazard_interface_area" ;;
  }

  dimension: sq_ft {
    type: number
    sql: ${TABLE}."sq_ft" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
  }

  dimension: supplemental_heating {
    type: string
    sql: ${TABLE}."supplemental_heating" ;;
  }

  dimension: terrain {
    type: string
    sql: ${TABLE}."terrain" ;;
  }

  dimension: times_rented {
    type: number
    sql: ${TABLE}."times_rented" ;;
  }

  dimension: unacceptable_animals {
    type: string
    sql: ${TABLE}."unacceptable_animals" ;;
  }

  dimension: under_construction {
    type: string
    sql: ${TABLE}."under_construction" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}."vin" ;;
  }

  dimension: water_alarm {
    type: string
    sql: ${TABLE}."water_alarm" ;;
  }

  dimension: water_detection {
    type: string
    sql: ${TABLE}."water_detection" ;;
  }

  dimension: water_protective_device {
    type: string
    sql: ${TABLE}."water_protective_device" ;;
  }

  dimension: wildfire_grade {
    type: string
    sql: ${TABLE}."wildfire_grade" ;;
  }

  dimension: wildfire_risk_score {
    type: number
    sql: ${TABLE}."wildfire_risk_score" ;;
  }

  dimension: willing_to_sign_exclusion_for_dog_breed {
    type: string
    sql: ${TABLE}."willing_to_sign_exclusion_for_dog_breed" ;;
  }

  dimension: wind_borne_debris_region {
    type: string
    sql: ${TABLE}."wind_borne_debris_region" ;;
  }

  dimension: wiring_location {
    type: string
    sql: ${TABLE}."wiring_location" ;;
  }

  dimension: wiring_material {
    type: string
    sql: ${TABLE}."wiring_material" ;;
  }

  dimension: within_park {
    type: string
    sql: ${TABLE}."within_park" ;;
  }

  dimension: wood_burning_stove_or_space_heater {
    type: string
    sql: ${TABLE}."wood_burning_stove_or_space_heater" ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}."year_built" ;;
  }

  dimension: years_at_residence {
    type: number
    sql: ${TABLE}."years_at_residence" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
