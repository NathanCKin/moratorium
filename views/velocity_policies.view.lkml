# The name of this view in Looker is "Velocity Policies"
view: velocity_policies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.velocity_policies ;;
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
    # This dimension will be called "Accounting Detail" in Explore.

  dimension: accounting_detail {
    type: string
    sql: ${TABLE}."accounting_detail" ;;
  }

  dimension: accredited_builder {
    type: yesno
    sql: ${TABLE}."accredited_builder" ;;
  }

  dimension: action_items {
    type: string
    sql: ${TABLE}."action_items" ;;
  }

  dimension: actual_cash_value_loss_settlement {
    type: string
    sql: ${TABLE}."actual_cash_value_loss_settlement" ;;
  }

  dimension: actual_insurance_score_band {
    type: string
    sql: ${TABLE}."actual_insurance_score_band" ;;
  }

  dimension: acv_loss_settlement_windstorm_or_hail_roof_surfaces {
    type: string
    sql: ${TABLE}."acv_loss_settlement_windstorm_or_hail_roof_surfaces" ;;
  }

  dimension: additional_living_expense_e {
    type: string
    sql: ${TABLE}."additional_living_expense_e" ;;
  }

  dimension: all_other_perils {
    type: string
    sql: ${TABLE}."all_other_perils" ;;
  }

  dimension: all_other_perils_exclusion {
    type: string
    sql: ${TABLE}."all_other_perils_exclusion" ;;
  }

  dimension: animal_liability {
    type: string
    sql: ${TABLE}."animal_liability" ;;
  }

  dimension: applicant_cell {
    type: string
    sql: ${TABLE}."applicant_cell" ;;
  }

  dimension: applicant_children_in_household {
    type: string
    sql: ${TABLE}."applicant_children_in_household" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: applicant_date_of_birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."applicant_date_of_birth" ;;
  }

  dimension: applicant_email {
    type: string
    sql: ${TABLE}."applicant_email" ;;
  }

  dimension: applicant_first {
    type: string
    sql: ${TABLE}."applicant_first" ;;
  }

  dimension: applicant_insured_type {
    type: string
    sql: ${TABLE}."applicant_insured_type" ;;
  }

  dimension: applicant_international_address {
    type: string
    sql: ${TABLE}."applicant_international_address" ;;
  }

  dimension: applicant_last_or_company {
    type: string
    sql: ${TABLE}."applicant_last_or_company" ;;
  }

  dimension: applicant_m_i {
    type: string
    sql: ${TABLE}."applicant_m_i" ;;
  }

  dimension: applicant_mailing_address {
    type: string
    sql: ${TABLE}."applicant_mailing_address" ;;
  }

  dimension: applicant_mailing_address_city {
    type: string
    sql: ${TABLE}."applicant_mailing_address_city" ;;
  }

  dimension: applicant_mailing_address_line_2 {
    type: string
    sql: ${TABLE}."applicant_mailing_address_line_2" ;;
  }

  dimension: applicant_mailing_address_state {
    type: string
    sql: ${TABLE}."applicant_mailing_address_state" ;;
  }

  dimension: applicant_mailing_address_zip {
    type: string
    sql: ${TABLE}."applicant_mailing_address_zip" ;;
  }

  dimension: applicant_mailing_address_zip2 {
    type: string
    sql: ${TABLE}."applicant_mailing_address_zip2" ;;
  }

  dimension: applicant_marital_status {
    type: string
    sql: ${TABLE}."applicant_marital_status" ;;
  }

  dimension: applicant_primary_phone {
    type: string
    sql: ${TABLE}."applicant_primary_phone" ;;
  }

  dimension: applicant_prior_address {
    type: string
    sql: ${TABLE}."applicant_prior_address" ;;
  }

  dimension: applicant_prior_address_city {
    type: string
    sql: ${TABLE}."applicant_prior_address_city" ;;
  }

  dimension: applicant_prior_address_line_2 {
    type: string
    sql: ${TABLE}."applicant_prior_address_line_2" ;;
  }

  dimension: applicant_prior_address_state {
    type: string
    sql: ${TABLE}."applicant_prior_address_state" ;;
  }

  dimension: applicant_prior_address_zip {
    type: string
    sql: ${TABLE}."applicant_prior_address_zip" ;;
  }

  dimension: applicant_prior_address_zip2 {
    type: string
    sql: ${TABLE}."applicant_prior_address_zip2" ;;
  }

  dimension: balance_in_cents {
    type: number
    sql: ${TABLE}."balance_in_cents" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_balance_in_cents {
    type: sum
    sql: ${balance_in_cents} ;;  }
  measure: average_balance_in_cents {
    type: average
    sql: ${balance_in_cents} ;;  }

  dimension: bceg {
    type: string
    sql: ${TABLE}."bceg" ;;
  }

  dimension: burglar_alarm {
    type: string
    sql: ${TABLE}."burglar_alarm" ;;
  }

  dimension: business_property {
    type: string
    sql: ${TABLE}."business_property" ;;
  }

  dimension: census_block_group {
    type: string
    sql: ${TABLE}."census_block_group" ;;
  }

  dimension: coapplicant_cell {
    type: string
    sql: ${TABLE}."coapplicant_cell" ;;
  }

  dimension_group: coapplicant_date_of_birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."coapplicant_date_of_birth" ;;
  }

  dimension: coapplicant_email {
    type: string
    sql: ${TABLE}."coapplicant_email" ;;
  }

  dimension: coapplicant_first {
    type: string
    sql: ${TABLE}."coapplicant_first" ;;
  }

  dimension: coapplicant_insured_type {
    type: string
    sql: ${TABLE}."coapplicant_insured_type" ;;
  }

  dimension: coapplicant_international_address {
    type: string
    sql: ${TABLE}."coapplicant_international_address" ;;
  }

  dimension: coapplicant_last_or_company {
    type: string
    sql: ${TABLE}."coapplicant_last_or_company" ;;
  }

  dimension: coapplicant_m_i {
    type: string
    sql: ${TABLE}."coapplicant_m_i" ;;
  }

  dimension: coapplicant_mailing_address {
    type: string
    sql: ${TABLE}."coapplicant_mailing_address" ;;
  }

  dimension: coapplicant_mailing_address_city {
    type: string
    sql: ${TABLE}."coapplicant_mailing_address_city" ;;
  }

  dimension: coapplicant_mailing_address_line_2 {
    type: string
    sql: ${TABLE}."coapplicant_mailing_address_line_2" ;;
  }

  dimension: coapplicant_mailing_address_state {
    type: string
    sql: ${TABLE}."coapplicant_mailing_address_state" ;;
  }

  dimension: coapplicant_mailing_address_zip {
    type: string
    sql: ${TABLE}."coapplicant_mailing_address_zip" ;;
  }

  dimension: coapplicant_mailing_address_zip2 {
    type: string
    sql: ${TABLE}."coapplicant_mailing_address_zip2" ;;
  }

  dimension: coapplicant_primary_phone {
    type: string
    sql: ${TABLE}."coapplicant_primary_phone" ;;
  }

  dimension: coapplicant_prior_address {
    type: string
    sql: ${TABLE}."coapplicant_prior_address" ;;
  }

  dimension: coapplicant_prior_address_city {
    type: string
    sql: ${TABLE}."coapplicant_prior_address_city" ;;
  }

  dimension: coapplicant_prior_address_line_2 {
    type: string
    sql: ${TABLE}."coapplicant_prior_address_line_2" ;;
  }

  dimension: coapplicant_prior_address_state {
    type: string
    sql: ${TABLE}."coapplicant_prior_address_state" ;;
  }

  dimension: coapplicant_prior_address_zip {
    type: string
    sql: ${TABLE}."coapplicant_prior_address_zip" ;;
  }

  dimension: coapplicant_prior_address_zip2 {
    type: string
    sql: ${TABLE}."coapplicant_prior_address_zip2" ;;
  }

  dimension: construction_type {
    type: string
    sql: ${TABLE}."construction_type" ;;
  }

  dimension: construction_year {
    type: number
    sql: ${TABLE}."construction_year" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: created_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."created_date" ;;
  }

  dimension: credit_card_electronic_fund_transfer {
    type: string
    sql: ${TABLE}."credit_card_electronic_fund_transfer" ;;
  }

  dimension: dead_bolts {
    type: string
    sql: ${TABLE}."dead_bolts" ;;
  }

  dimension: deductibles {
    type: string
    sql: ${TABLE}."deductibles" ;;
  }

  dimension: direct_premium_in_cents {
    type: number
    sql: ${TABLE}."direct_premium_in_cents" ;;
  }

  dimension: direct_repair {
    type: string
    sql: ${TABLE}."direct_repair" ;;
  }

  dimension: direct_repair_endorsement {
    type: string
    sql: ${TABLE}."direct_repair_endorsement" ;;
  }

  dimension: distance_to_coast {
    type: string
    sql: ${TABLE}."distance_to_coast" ;;
  }

  dimension: dwelling_a {
    type: number
    sql: ${TABLE}."dwelling_a" ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension: electronic_apparatus_in_or_upon_a_motor_vehicle {
    type: string
    sql: ${TABLE}."electronic_apparatus_in_or_upon_a_motor_vehicle" ;;
  }

  dimension: enhanced_home_package {
    type: string
    sql: ${TABLE}."enhanced_home_package" ;;
  }

  dimension: estimated_market_value_in_dollars {
    type: number
    sql: ${TABLE}."estimated_market_value_in_dollars" ;;
  }

  dimension: exclude_wind {
    type: yesno
    sql: ${TABLE}."exclude_wind" ;;
  }

  dimension: exterior_wall_construction {
    type: string
    sql: ${TABLE}."exterior_wall_construction" ;;
  }

  dimension: exterior_wall_finish {
    type: string
    sql: ${TABLE}."exterior_wall_finish" ;;
  }

  dimension: fair_rental_value_d {
    type: string
    sql: ${TABLE}."fair_rental_value_d" ;;
  }

  dimension: familiy_units_in_building {
    type: string
    sql: ${TABLE}."familiy_units_in_building" ;;
  }

  dimension: family_units_in_building {
    type: string
    sql: ${TABLE}."family_units_in_building" ;;
  }

  dimension: fees_in_cents {
    type: number
    sql: ${TABLE}."fees_in_cents" ;;
  }

  dimension: fire_extinguisher {
    type: string
    sql: ${TABLE}."fire_extinguisher" ;;
  }

  dimension: fire_protective_devices {
    type: string
    sql: ${TABLE}."fire_protective_devices" ;;
  }

  dimension: first_additional_insured_email {
    type: string
    sql: ${TABLE}."first_additional_insured_email" ;;
  }

  dimension: first_additional_insured_first {
    type: string
    sql: ${TABLE}."first_additional_insured_first" ;;
  }

  dimension: first_additional_insured_insured_type {
    type: string
    sql: ${TABLE}."first_additional_insured_insured_type" ;;
  }

  dimension: first_additional_insured_international_address {
    type: string
    sql: ${TABLE}."first_additional_insured_international_address" ;;
  }

  dimension: first_additional_insured_last_or_company {
    type: string
    sql: ${TABLE}."first_additional_insured_last_or_company" ;;
  }

  dimension: first_additional_insured_m_i {
    type: string
    sql: ${TABLE}."first_additional_insured_m_i" ;;
  }

  dimension: first_additional_insured_mailing_address {
    type: string
    sql: ${TABLE}."first_additional_insured_mailing_address" ;;
  }

  dimension: first_additional_insured_mailing_address_city {
    type: string
    sql: ${TABLE}."first_additional_insured_mailing_address_city" ;;
  }

  dimension: first_additional_insured_mailing_address_line_2 {
    type: string
    sql: ${TABLE}."first_additional_insured_mailing_address_line_2" ;;
  }

  dimension: first_additional_insured_mailing_address_state {
    type: string
    sql: ${TABLE}."first_additional_insured_mailing_address_state" ;;
  }

  dimension: first_additional_insured_mailing_address_zip {
    type: string
    sql: ${TABLE}."first_additional_insured_mailing_address_zip" ;;
  }

  dimension: first_additional_insured_mailing_address_zip2 {
    type: string
    sql: ${TABLE}."first_additional_insured_mailing_address_zip2" ;;
  }

  dimension: first_additional_insured_primary_phone {
    type: string
    sql: ${TABLE}."first_additional_insured_primary_phone" ;;
  }

  dimension: first_additional_interest_email {
    type: string
    sql: ${TABLE}."first_additional_interest_email" ;;
  }

  dimension: first_additional_interest_first {
    type: string
    sql: ${TABLE}."first_additional_interest_first" ;;
  }

  dimension: first_additional_interest_interest_type {
    type: string
    sql: ${TABLE}."first_additional_interest_interest_type" ;;
  }

  dimension: first_additional_interest_international_address {
    type: string
    sql: ${TABLE}."first_additional_interest_international_address" ;;
  }

  dimension: first_additional_interest_last_or_company {
    type: string
    sql: ${TABLE}."first_additional_interest_last_or_company" ;;
  }

  dimension: first_additional_interest_m_i {
    type: string
    sql: ${TABLE}."first_additional_interest_m_i" ;;
  }

  dimension: first_additional_interest_mailing_address {
    type: string
    sql: ${TABLE}."first_additional_interest_mailing_address" ;;
  }

  dimension: first_additional_interest_mailing_address_city {
    type: string
    sql: ${TABLE}."first_additional_interest_mailing_address_city" ;;
  }

  dimension: first_additional_interest_mailing_address_line_2 {
    type: string
    sql: ${TABLE}."first_additional_interest_mailing_address_line_2" ;;
  }

  dimension: first_additional_interest_mailing_address_state {
    type: string
    sql: ${TABLE}."first_additional_interest_mailing_address_state" ;;
  }

  dimension: first_additional_interest_mailing_address_zip {
    type: string
    sql: ${TABLE}."first_additional_interest_mailing_address_zip" ;;
  }

  dimension: first_additional_interest_mailing_address_zip2 {
    type: string
    sql: ${TABLE}."first_additional_interest_mailing_address_zip2" ;;
  }

  dimension: first_additional_interest_primary_phone {
    type: string
    sql: ${TABLE}."first_additional_interest_primary_phone" ;;
  }

  dimension: first_mortgagee_address {
    type: string
    sql: ${TABLE}."first_mortgagee_address" ;;
  }

  dimension: first_mortgagee_address_city {
    type: string
    sql: ${TABLE}."first_mortgagee_address_city" ;;
  }

  dimension: first_mortgagee_address_line_2 {
    type: string
    sql: ${TABLE}."first_mortgagee_address_line_2" ;;
  }

  dimension: first_mortgagee_address_state {
    type: string
    sql: ${TABLE}."first_mortgagee_address_state" ;;
  }

  dimension: first_mortgagee_address_zip {
    type: string
    sql: ${TABLE}."first_mortgagee_address_zip" ;;
  }

  dimension: first_mortgagee_address_zip2 {
    type: string
    sql: ${TABLE}."first_mortgagee_address_zip2" ;;
  }

  dimension: first_mortgagee_international_address {
    type: string
    sql: ${TABLE}."first_mortgagee_international_address" ;;
  }

  dimension: first_mortgagee_loan_number {
    type: string
    sql: ${TABLE}."first_mortgagee_loan_number" ;;
  }

  dimension: first_mortgagee_name {
    type: string
    sql: ${TABLE}."first_mortgagee_name" ;;
  }

  dimension: first_mortgagee_phone_number {
    type: string
    sql: ${TABLE}."first_mortgagee_phone_number" ;;
  }

  dimension: floor_of_interest {
    type: string
    sql: ${TABLE}."floor_of_interest" ;;
  }

  dimension: florida_building_code {
    type: string
    sql: ${TABLE}."florida_building_code" ;;
  }

  dimension: foundation {
    type: string
    sql: ${TABLE}."foundation" ;;
  }

  dimension: foundation_and_water_damage {
    type: string
    sql: ${TABLE}."foundation_and_water_damage" ;;
  }

  dimension: foundation_type {
    type: string
    sql: ${TABLE}."foundation_type" ;;
  }

  dimension: functional_replacement_cost {
    type: string
    sql: ${TABLE}."functional_replacement_cost" ;;
  }

  dimension: gable_end_bracing {
    type: string
    sql: ${TABLE}."gable_end_bracing" ;;
  }

  dimension: general {
    type: string
    sql: ${TABLE}."general" ;;
  }

  dimension: golf_cart {
    type: string
    sql: ${TABLE}."golf_cart" ;;
  }

  dimension: hail_resistant_roof {
    type: string
    sql: ${TABLE}."hail_resistant_roof" ;;
  }

  dimension: home_computers {
    type: string
    sql: ${TABLE}."home_computers" ;;
  }

  dimension: home_systems_protection {
    type: string
    sql: ${TABLE}."home_systems_protection" ;;
  }

  dimension: hurricane {
    type: string
    sql: ${TABLE}."hurricane" ;;
  }

  dimension: hurricane_screened_enclosure {
    type: string
    sql: ${TABLE}."hurricane_screened_enclosure" ;;
  }

  dimension: identity_fraud_expense {
    type: string
    sql: ${TABLE}."identity_fraud_expense" ;;
  }

  dimension: ignored {
    type: yesno
    sql: ${TABLE}."ignored" ;;
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

  dimension: is_feet_to_hydrant_less_than_1000ft {
    type: yesno
    sql: ${TABLE}."is_feet_to_hydrant_less_than_1000ft" ;;
  }

  dimension: is_property_located_on_a_barrier_island {
    type: yesno
    sql: ${TABLE}."is_property_located_on_a_barrier_island" ;;
  }

  dimension: is_property_located_on_a_seawall {
    type: yesno
    sql: ${TABLE}."is_property_located_on_a_seawall" ;;
  }

  dimension: jewelry_watches_and_furs {
    type: string
    sql: ${TABLE}."jewelry_watches_and_furs" ;;
  }

  dimension: limited_fungi_increased_coverage {
    type: string
    sql: ${TABLE}."limited_fungi_increased_coverage" ;;
  }

  dimension: limited_fungi_mold_wet_or_dry_rot_or_bacteria {
    type: string
    sql: ${TABLE}."limited_fungi_mold_wet_or_dry_rot_or_bacteria" ;;
  }

  dimension: limited_water_damage {
    type: string
    sql: ${TABLE}."limited_water_damage" ;;
  }

  dimension: located_in_high_velocity_hurricane_zone {
    type: yesno
    sql: ${TABLE}."located_in_high_velocity_hurricane_zone" ;;
  }

  dimension: located_in_windpool_eligible_area {
    type: yesno
    sql: ${TABLE}."located_in_windpool_eligible_area" ;;
  }

  dimension: loss_assessment {
    type: string
    sql: ${TABLE}."loss_assessment" ;;
  }

  dimension: loss_history {
    type: string
    sql: ${TABLE}."loss_history" ;;
  }

  dimension: loss_of_use_d {
    type: string
    sql: ${TABLE}."loss_of_use_d" ;;
  }

  dimension: medical_payments_f {
    type: string
    sql: ${TABLE}."medical_payments_f" ;;
  }

  dimension: medical_payments_m {
    type: string
    sql: ${TABLE}."medical_payments_m" ;;
  }

  dimension: memos {
    type: string
    sql: ${TABLE}."memos" ;;
  }

  dimension: miles_to_fire_department {
    type: string
    sql: ${TABLE}."miles_to_fire_department" ;;
  }

  dimension: money {
    type: string
    sql: ${TABLE}."money" ;;
  }

  dimension: months_unoccupied {
    type: string
    sql: ${TABLE}."months_unoccupied" ;;
  }

  dimension: number_of_carts {
    type: string
    sql: ${TABLE}."number_of_carts" ;;
  }

  dimension: number_of_fireplaces {
    type: number
    sql: ${TABLE}."number_of_fireplaces" ;;
  }

  dimension: number_of_floors_in_building {
    type: string
    sql: ${TABLE}."number_of_floors_in_building" ;;
  }

  dimension: number_of_full_bathrooms {
    type: number
    sql: ${TABLE}."number_of_full_bathrooms" ;;
  }

  dimension: number_of_half_bathrooms {
    type: number
    sql: ${TABLE}."number_of_half_bathrooms" ;;
  }

  dimension: number_of_stories {
    type: string
    sql: ${TABLE}."number_of_stories" ;;
  }

  dimension: number_of_stories_in_unit {
    type: string
    sql: ${TABLE}."number_of_stories_in_unit" ;;
  }

  dimension: number_of_times_rented_per_year {
    type: string
    sql: ${TABLE}."number_of_times_rented_per_year" ;;
  }

  dimension: occupancy {
    type: string
    sql: ${TABLE}."occupancy" ;;
  }

  dimension: opening_protection {
    type: string
    sql: ${TABLE}."opening_protection" ;;
  }

  dimension: ordinance_or_law {
    type: string
    sql: ${TABLE}."ordinance_or_law" ;;
  }

  dimension: other_structures_b {
    type: string
    sql: ${TABLE}."other_structures_b" ;;
  }

  dimension: pay_plan {
    type: string
    sql: ${TABLE}."pay_plan" ;;
  }

  dimension: percent_of_lowest_level_finished {
    type: string
    sql: ${TABLE}."percent_of_lowest_level_finished" ;;
  }

  dimension: permitted_incidental_occupancy {
    type: string
    sql: ${TABLE}."permitted_incidental_occupancy" ;;
  }

  dimension: personal_injury {
    type: string
    sql: ${TABLE}."personal_injury" ;;
  }

  dimension: personal_liability_e {
    type: string
    sql: ${TABLE}."personal_liability_e" ;;
  }

  dimension: personal_liability_l {
    type: string
    sql: ${TABLE}."personal_liability_l" ;;
  }

  dimension: personal_property_c {
    type: string
    sql: ${TABLE}."personal_property_c" ;;
  }

  dimension: personal_property_replacement_cost {
    type: string
    sql: ${TABLE}."personal_property_replacement_cost" ;;
  }

  dimension: personal_property_replacement_cost_coverage_c {
    type: string
    sql: ${TABLE}."personal_property_replacement_cost_coverage_c" ;;
  }

  dimension: policy_number {
    type: string
    sql: ${TABLE}."policy_number" ;;
  }

  dimension: predominant_roof_covering {
    type: string
    sql: ${TABLE}."predominant_roof_covering" ;;
  }

  dimension: primary_heating_cooling_system_permanently_installed {
    type: string
    sql: ${TABLE}."primary_heating_cooling_system_permanently_installed" ;;
  }

  dimension: prior_liability_limit {
    type: string
    sql: ${TABLE}."prior_liability_limit" ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}."product_code" ;;
  }

  dimension: property_address {
    type: string
    sql: ${TABLE}."property_address" ;;
  }

  dimension: property_address_city {
    type: string
    sql: ${TABLE}."property_address_city" ;;
  }

  dimension: property_address_line_2 {
    type: string
    sql: ${TABLE}."property_address_line_2" ;;
  }

  dimension: property_address_state {
    type: string
    sql: ${TABLE}."property_address_state" ;;
  }

  dimension: property_address_zip {
    type: string
    sql: ${TABLE}."property_address_zip" ;;
  }

  dimension: property_address_zip2 {
    type: string
    sql: ${TABLE}."property_address_zip2" ;;
  }

  dimension: protection_class {
    type: string
    sql: ${TABLE}."protection_class" ;;
  }

  dimension: purchase_date {
    type: string
    sql: ${TABLE}."purchase_date" ;;
  }

  dimension: quality_grade {
    type: string
    sql: ${TABLE}."quality_grade" ;;
  }

  dimension: renewal_payor {
    type: string
    sql: ${TABLE}."renewal_payor" ;;
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

  dimension: renovation_year_roofing {
    type: number
    sql: ${TABLE}."renovation_year_roofing" ;;
  }

  dimension: renovation_year_water_heater {
    type: number
    sql: ${TABLE}."renovation_year_water_heater" ;;
  }

  dimension: rental_to_others_theft {
    type: string
    sql: ${TABLE}."rental_to_others_theft" ;;
  }

  dimension: rental_type {
    type: string
    sql: ${TABLE}."rental_type" ;;
  }

  dimension: replacement_cost_in_dollars {
    type: number
    sql: ${TABLE}."replacement_cost_in_dollars" ;;
  }

  dimension: residence_type {
    type: string
    sql: ${TABLE}."residence_type" ;;
  }

  dimension: responding_fire_station {
    type: string
    sql: ${TABLE}."responding_fire_station" ;;
  }

  dimension: roof_deck_attachment {
    type: string
    sql: ${TABLE}."roof_deck_attachment" ;;
  }

  dimension: roof_geometry {
    type: string
    sql: ${TABLE}."roof_geometry" ;;
  }

  dimension: roof_to_wall_attachment {
    type: string
    sql: ${TABLE}."roof_to_wall_attachment" ;;
  }

  dimension: roof_type {
    type: string
    sql: ${TABLE}."roof_type" ;;
  }

  dimension: second_additional_insured_email {
    type: string
    sql: ${TABLE}."second_additional_insured_email" ;;
  }

  dimension: second_additional_insured_first {
    type: string
    sql: ${TABLE}."second_additional_insured_first" ;;
  }

  dimension: second_additional_insured_insured_type {
    type: string
    sql: ${TABLE}."second_additional_insured_insured_type" ;;
  }

  dimension: second_additional_insured_international_address {
    type: string
    sql: ${TABLE}."second_additional_insured_international_address" ;;
  }

  dimension: second_additional_insured_last_or_company {
    type: string
    sql: ${TABLE}."second_additional_insured_last_or_company" ;;
  }

  dimension: second_additional_insured_m_i {
    type: string
    sql: ${TABLE}."second_additional_insured_m_i" ;;
  }

  dimension: second_additional_insured_mailing_address {
    type: string
    sql: ${TABLE}."second_additional_insured_mailing_address" ;;
  }

  dimension: second_additional_insured_mailing_address_city {
    type: string
    sql: ${TABLE}."second_additional_insured_mailing_address_city" ;;
  }

  dimension: second_additional_insured_mailing_address_line_2 {
    type: string
    sql: ${TABLE}."second_additional_insured_mailing_address_line_2" ;;
  }

  dimension: second_additional_insured_mailing_address_state {
    type: string
    sql: ${TABLE}."second_additional_insured_mailing_address_state" ;;
  }

  dimension: second_additional_insured_mailing_address_zip {
    type: string
    sql: ${TABLE}."second_additional_insured_mailing_address_zip" ;;
  }

  dimension: second_additional_insured_mailing_address_zip2 {
    type: string
    sql: ${TABLE}."second_additional_insured_mailing_address_zip2" ;;
  }

  dimension: second_additional_insured_primary_phone {
    type: string
    sql: ${TABLE}."second_additional_insured_primary_phone" ;;
  }

  dimension: second_additional_interest_email {
    type: string
    sql: ${TABLE}."second_additional_interest_email" ;;
  }

  dimension: second_additional_interest_first {
    type: string
    sql: ${TABLE}."second_additional_interest_first" ;;
  }

  dimension: second_additional_interest_interest_type {
    type: string
    sql: ${TABLE}."second_additional_interest_interest_type" ;;
  }

  dimension: second_additional_interest_international_address {
    type: string
    sql: ${TABLE}."second_additional_interest_international_address" ;;
  }

  dimension: second_additional_interest_last_or_company {
    type: string
    sql: ${TABLE}."second_additional_interest_last_or_company" ;;
  }

  dimension: second_additional_interest_m_i {
    type: string
    sql: ${TABLE}."second_additional_interest_m_i" ;;
  }

  dimension: second_additional_interest_mailing_address {
    type: string
    sql: ${TABLE}."second_additional_interest_mailing_address" ;;
  }

  dimension: second_additional_interest_mailing_address_city {
    type: string
    sql: ${TABLE}."second_additional_interest_mailing_address_city" ;;
  }

  dimension: second_additional_interest_mailing_address_line_2 {
    type: string
    sql: ${TABLE}."second_additional_interest_mailing_address_line_2" ;;
  }

  dimension: second_additional_interest_mailing_address_state {
    type: string
    sql: ${TABLE}."second_additional_interest_mailing_address_state" ;;
  }

  dimension: second_additional_interest_mailing_address_zip {
    type: string
    sql: ${TABLE}."second_additional_interest_mailing_address_zip" ;;
  }

  dimension: second_additional_interest_mailing_address_zip2 {
    type: string
    sql: ${TABLE}."second_additional_interest_mailing_address_zip2" ;;
  }

  dimension: second_additional_interest_primary_phone {
    type: string
    sql: ${TABLE}."second_additional_interest_primary_phone" ;;
  }

  dimension: second_mortgagee_address {
    type: string
    sql: ${TABLE}."second_mortgagee_address" ;;
  }

  dimension: second_mortgagee_address_city {
    type: string
    sql: ${TABLE}."second_mortgagee_address_city" ;;
  }

  dimension: second_mortgagee_address_line_2 {
    type: string
    sql: ${TABLE}."second_mortgagee_address_line_2" ;;
  }

  dimension: second_mortgagee_address_state {
    type: string
    sql: ${TABLE}."second_mortgagee_address_state" ;;
  }

  dimension: second_mortgagee_address_zip {
    type: string
    sql: ${TABLE}."second_mortgagee_address_zip" ;;
  }

  dimension: second_mortgagee_address_zip2 {
    type: string
    sql: ${TABLE}."second_mortgagee_address_zip2" ;;
  }

  dimension: second_mortgagee_international_address {
    type: string
    sql: ${TABLE}."second_mortgagee_international_address" ;;
  }

  dimension: second_mortgagee_loan_number {
    type: string
    sql: ${TABLE}."second_mortgagee_loan_number" ;;
  }

  dimension: second_mortgagee_name {
    type: string
    sql: ${TABLE}."second_mortgagee_name" ;;
  }

  dimension: second_mortgagee_phone_number {
    type: string
    sql: ${TABLE}."second_mortgagee_phone_number" ;;
  }

  dimension: secondary_water_resistance {
    type: string
    sql: ${TABLE}."secondary_water_resistance" ;;
  }

  dimension: secured_community {
    type: string
    sql: ${TABLE}."secured_community" ;;
  }

  dimension: securities {
    type: string
    sql: ${TABLE}."securities" ;;
  }

  dimension: silverware_goldware_and_pewterware {
    type: string
    sql: ${TABLE}."silverware_goldware_and_pewterware" ;;
  }

  dimension: sinkhole {
    type: string
    sql: ${TABLE}."sinkhole" ;;
  }

  dimension: smoke_alarm {
    type: string
    sql: ${TABLE}."smoke_alarm" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension: special_limits_of_liability {
    type: string
    sql: ${TABLE}."special_limits_of_liability" ;;
  }

  dimension: special_personal_property {
    type: string
    sql: ${TABLE}."special_personal_property" ;;
  }

  dimension: specified_additional_amount_of_insurance_coverage_a {
    type: string
    sql: ${TABLE}."specified_additional_amount_of_insurance_coverage_a" ;;
  }

  dimension: sprinkler_system {
    type: string
    sql: ${TABLE}."sprinkler_system" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: supplemental_heating_device {
    type: yesno
    sql: ${TABLE}."supplemental_heating_device" ;;
  }

  dimension: tapes_records_discs_or_other_media_in_or_upon_a_motor_vehicle {
    type: string
    sql: ${TABLE}."tapes_records_discs_or_other_media_in_or_upon_a_motor_vehicle" ;;
  }

  dimension: terrain {
    type: string
    sql: ${TABLE}."terrain" ;;
  }

  dimension: theft_coverage {
    type: string
    sql: ${TABLE}."theft_coverage" ;;
  }

  dimension: timeshare {
    type: string
    sql: ${TABLE}."timeshare" ;;
  }

  dimension: total_direct_in_cents {
    type: number
    sql: ${TABLE}."total_direct_in_cents" ;;
  }

  dimension: total_finished_square_footage {
    type: number
    sql: ${TABLE}."total_finished_square_footage" ;;
  }

  dimension: total_policy_in_cents {
    type: number
    sql: ${TABLE}."total_policy_in_cents" ;;
  }

  dimension: total_renovation_year {
    type: string
    sql: ${TABLE}."total_renovation_year" ;;
  }

  dimension: tran_cd {
    type: string
    sql: ${TABLE}."tran_cd" ;;
  }

  dimension_group: transaction_eff {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."transaction_eff_date" ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}."transaction_id" ;;
  }

  dimension: units_in_building {
    type: string
    sql: ${TABLE}."units_in_building" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: usage_type {
    type: string
    sql: ${TABLE}."usage_type" ;;
  }

  dimension: water {
    type: string
    sql: ${TABLE}."water" ;;
  }

  dimension: water_back_up_and_sump_overflow {
    type: string
    sql: ${TABLE}."water_back_up_and_sump_overflow" ;;
  }

  dimension: water_damage {
    type: string
    sql: ${TABLE}."water_damage" ;;
  }

  dimension: water_damage_exclusion {
    type: string
    sql: ${TABLE}."water_damage_exclusion" ;;
  }

  dimension: water_protective_devices {
    type: string
    sql: ${TABLE}."water_protective_devices" ;;
  }

  dimension: wbdr {
    type: yesno
    sql: ${TABLE}."wbdr" ;;
  }

  dimension: wind_or_hail_screened_enclosures_and_carports {
    type: string
    sql: ${TABLE}."wind_or_hail_screened_enclosures_and_carports" ;;
  }

  dimension: wind_speed {
    type: string
    sql: ${TABLE}."wind_speed" ;;
  }

  dimension: windstorm_or_hail {
    type: string
    sql: ${TABLE}."windstorm_or_hail" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, second_mortgagee_name, first_mortgagee_name]
  }
}
