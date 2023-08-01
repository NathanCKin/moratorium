# The name of this view in Looker is "External Book Policies"
view: external_book_policies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.external_book_policies ;;
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
    # This dimension will be called "Additional Coverage A" in Explore.

  dimension: additional_coverage_a {
    type: string
    sql: ${TABLE}."additional_coverage_a" ;;
  }

  dimension: age_of_insured {
    type: number
    sql: ${TABLE}."age_of_insured" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age_of_insured {
    type: sum
    sql: ${age_of_insured} ;;  }
  measure: average_age_of_insured {
    type: average
    sql: ${age_of_insured} ;;  }

  dimension: animal_liability {
    type: number
    sql: ${TABLE}."animal_liability" ;;
  }

  dimension: aop_deductible {
    type: string
    sql: ${TABLE}."aop_deductible" ;;
  }

  dimension: bceg {
    type: string
    sql: ${TABLE}."bceg" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: builder {
    type: string
    sql: ${TABLE}."builder" ;;
  }

  dimension: burglar_alarm {
    type: string
    sql: ${TABLE}."burglar_alarm" ;;
  }

  dimension: census_block_group {
    type: string
    sql: ${TABLE}."census_block_group" ;;
  }

  dimension: chargeable_losses {
    type: number
    sql: ${TABLE}."chargeable_losses" ;;
  }

  dimension: co_applicant_first_name {
    type: string
    sql: ${TABLE}."co_applicant_first_name" ;;
  }

  dimension: co_applicant_id {
    type: number
    sql: ${TABLE}."co_applicant_id" ;;
  }

  dimension: co_applicant_last_name {
    type: string
    sql: ${TABLE}."co_applicant_last_name" ;;
  }

  dimension: construction_type {
    type: string
    sql: ${TABLE}."construction_type" ;;
  }

  dimension: coverage_a {
    type: number
    sql: ${TABLE}."coverage_a" ;;
  }

  dimension: coverage_b {
    type: string
    sql: ${TABLE}."coverage_b" ;;
  }

  dimension: coverage_c {
    type: string
    sql: ${TABLE}."coverage_c" ;;
  }

  dimension: coverage_d {
    type: string
    sql: ${TABLE}."coverage_d" ;;
  }

  dimension: coverage_e {
    type: number
    sql: ${TABLE}."coverage_e" ;;
  }

  dimension: coverage_f {
    type: number
    sql: ${TABLE}."coverage_f" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: days_insurance_lapsed {
    type: string
    sql: ${TABLE}."days_insurance_lapsed" ;;
  }

  dimension: direct_repair {
    type: yesno
    sql: ${TABLE}."direct_repair" ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension: emergency_water_removal_service {
    type: yesno
    sql: ${TABLE}."emergency_water_removal_service" ;;
  }

  dimension: ex_premium {
    type: number
    sql: ${TABLE}."ex_premium" ;;
  }

  dimension: exterior_wall_finish {
    type: string
    sql: ${TABLE}."exterior_wall_finish" ;;
  }

  dimension: external_book_import_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."external_book_import_id" ;;
  }

  dimension: fbc_wind_speed {
    type: string
    sql: ${TABLE}."fbc_wind_speed" ;;
  }

  dimension: fire_alarm_monitoring {
    type: string
    sql: ${TABLE}."fire_alarm_monitoring" ;;
  }

  dimension: fire_alarm_sprinkler {
    type: string
    sql: ${TABLE}."fire_alarm_sprinkler" ;;
  }

  dimension: flood_and_water_backup2 {
    type: yesno
    sql: ${TABLE}."flood_and_water_backup2" ;;
  }

  dimension: foundation {
    type: string
    sql: ${TABLE}."foundation" ;;
  }

  dimension: golf_cart_count {
    type: string
    sql: ${TABLE}."golf_cart_count" ;;
  }

  dimension: golf_cart_limits {
    type: string
    sql: ${TABLE}."golf_cart_limits" ;;
  }

  dimension: hurricane_deductible {
    type: string
    sql: ${TABLE}."hurricane_deductible" ;;
  }

  dimension: hurricane_screened_enclosures {
    type: number
    sql: ${TABLE}."hurricane_screened_enclosures" ;;
  }

  dimension: identity_theft {
    type: number
    sql: ${TABLE}."identity_theft" ;;
  }

  dimension: insured_address {
    type: string
    sql: ${TABLE}."insured_address" ;;
  }

  dimension: insured_city {
    type: string
    sql: ${TABLE}."insured_city" ;;
  }

  dimension_group: insured_dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."insured_dob" ;;
  }

  dimension: insured_email_address {
    type: string
    sql: ${TABLE}."insured_email_address" ;;
  }

  dimension: insured_first_name {
    type: string
    sql: ${TABLE}."insured_first_name" ;;
  }

  dimension: insured_last_name {
    type: string
    sql: ${TABLE}."insured_last_name" ;;
  }

  dimension: insured_name {
    type: string
    sql: ${TABLE}."insured_name" ;;
  }

  dimension: insured_phone {
    type: string
    sql: ${TABLE}."insured_phone" ;;
  }

  dimension: insured_state {
    type: string
    sql: ${TABLE}."insured_state" ;;
  }

  dimension: insured_zip {
    type: string
    sql: ${TABLE}."insured_zip" ;;
  }

  dimension: limited_fungi {
    type: number
    sql: ${TABLE}."limited_fungi" ;;
  }

  dimension: loss_assessment {
    type: number
    sql: ${TABLE}."loss_assessment" ;;
  }

  dimension: loss_settlement {
    type: string
    sql: ${TABLE}."loss_settlement" ;;
  }

  dimension: months_occupied {
    type: number
    sql: ${TABLE}."months_occupied" ;;
  }

  dimension: opening_protection {
    type: string
    sql: ${TABLE}."opening_protection" ;;
  }

  dimension: ordinance_or_law {
    type: string
    sql: ${TABLE}."ordinance_or_law" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: personal_injury {
    type: yesno
    sql: ${TABLE}."personal_injury" ;;
  }

  dimension: policy_type {
    type: string
    sql: ${TABLE}."policy_type" ;;
  }

  dimension: property_address {
    type: string
    sql: ${TABLE}."property_address" ;;
  }

  dimension: property_city {
    type: string
    sql: ${TABLE}."property_city" ;;
  }

  dimension: property_zip {
    type: string
    sql: ${TABLE}."property_zip" ;;
  }

  dimension: protection_class {
    type: string
    sql: ${TABLE}."protection_class" ;;
  }

  dimension: quote_number {
    type: string
    sql: ${TABLE}."quote_number" ;;
  }

  dimension: replacement_cost_contents {
    type: yesno
    sql: ${TABLE}."replacement_cost_contents" ;;
  }

  dimension: responsible_repair {
    type: yesno
    sql: ${TABLE}."responsible_repair" ;;
  }

  dimension: roof_age {
    type: number
    sql: ${TABLE}."roof_age" ;;
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

  dimension: roof_shape {
    type: string
    sql: ${TABLE}."roof_shape" ;;
  }

  dimension: roof_wall_connection {
    type: string
    sql: ${TABLE}."roof_wall_connection" ;;
  }

  dimension: secondary_water_resistance {
    type: string
    sql: ${TABLE}."secondary_water_resistance" ;;
  }

  dimension: secured_community {
    type: string
    sql: ${TABLE}."secured_community" ;;
  }

  dimension: sinkhole_exclusion {
    type: yesno
    sql: ${TABLE}."sinkhole_exclusion" ;;
  }

  dimension: special_personal_property {
    type: yesno
    sql: ${TABLE}."special_personal_property" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
  }

  dimension: supplemental_heating {
    type: yesno
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

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: water_alarm {
    type: yesno
    sql: ${TABLE}."water_alarm" ;;
  }

  dimension: water_backup {
    type: number
    sql: ${TABLE}."water_backup" ;;
  }

  dimension: water_damage {
    type: string
    sql: ${TABLE}."water_damage" ;;
  }

  dimension: water_detection {
    type: string
    sql: ${TABLE}."water_detection" ;;
  }

  dimension: wind_borne_debris_region {
    type: string
    sql: ${TABLE}."wind_borne_debris_region" ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}."year_built" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	insured_last_name,
	co_applicant_first_name,
	insured_name,
	co_applicant_last_name,
	insured_first_name,
	external_book_imports.id
	]
  }

}
