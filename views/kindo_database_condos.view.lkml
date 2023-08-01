# The name of this view in Looker is "Kindo Database Condos"
view: kindo_database_condos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.kindo_database_condos ;;
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

  dimension: association_doc_link {
    type: string
    sql: ${TABLE}."association_doc_link" ;;
  }

  dimension: building_number {
    type: string
    sql: ${TABLE}."building_number" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: condo_name {
    type: string
    sql: ${TABLE}."condo_name" ;;
  }

  dimension: construction {
    type: string
    sql: ${TABLE}."construction" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: file_number {
    type: string
    sql: ${TABLE}."file_number" ;;
  }

  dimension: google_maps {
    type: string
    sql: ${TABLE}."google_maps" ;;
  }

  dimension: ho6_eligible {
    type: string
    sql: ${TABLE}."ho6_eligible" ;;
  }

  dimension: kindo_database_import_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."kindo_database_import_id" ;;
  }

  dimension: managing_entity_city {
    type: string
    sql: ${TABLE}."managing_entity_city" ;;
  }

  dimension: managing_entity_name {
    type: string
    sql: ${TABLE}."managing_entity_name" ;;
  }

  dimension: managing_entity_number {
    type: string
    sql: ${TABLE}."managing_entity_number" ;;
  }

  dimension: managing_entity_route {
    type: string
    sql: ${TABLE}."managing_entity_route" ;;
  }

  dimension: managing_entity_state {
    type: string
    sql: ${TABLE}."managing_entity_state" ;;
  }

  dimension: managing_entity_street {
    type: string
    sql: ${TABLE}."managing_entity_street" ;;
  }

  dimension: managing_entity_zip {
    type: string
    sql: ${TABLE}."managing_entity_zip" ;;
  }

  dimension: number_of_units {
    type: number
    sql: ${TABLE}."number_of_units" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_units {
    type: sum
    sql: ${number_of_units} ;;  }
  measure: average_number_of_units {
    type: average
    sql: ${number_of_units} ;;  }

  dimension: opening_protection {
    type: string
    sql: ${TABLE}."opening_protection" ;;
  }

  dimension: primary_status {
    type: string
    sql: ${TABLE}."primary_status" ;;
  }

  dimension: project_number {
    type: string
    sql: ${TABLE}."project_number" ;;
  }

  dimension: quality {
    type: string
    sql: ${TABLE}."quality" ;;
  }

  dimension: recorded_date {
    type: string
    sql: ${TABLE}."recorded_date" ;;
  }

  dimension: roof_covering {
    type: string
    sql: ${TABLE}."roof_covering" ;;
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

  dimension: sample_county_appraiser_site {
    type: string
    sql: ${TABLE}."sample_county_appraiser_site" ;;
  }

  dimension: sample_zillow_link {
    type: string
    sql: ${TABLE}."sample_zillow_link" ;;
  }

  dimension: screen_enclosures {
    type: string
    sql: ${TABLE}."screen_enclosures" ;;
  }

  dimension: secondary_status {
    type: string
    sql: ${TABLE}."secondary_status" ;;
  }

  dimension: secondary_water_resistance {
    type: string
    sql: ${TABLE}."secondary_water_resistance" ;;
  }

  dimension: sprinkler {
    type: string
    sql: ${TABLE}."sprinkler" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}."street" ;;
  }

  dimension: underwritten {
    type: string
    sql: ${TABLE}."underwritten" ;;
  }

  dimension: unit_matcher {
    type: string
    sql: ${TABLE}."unit_matcher" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

  dimension: wind_mit_link {
    type: string
    sql: ${TABLE}."wind_mit_link" ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}."year_built" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."zip" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, managing_entity_name, condo_name, kindo_database_imports.id]
  }
}
