# The name of this view in Looker is "Cape Locations"
view: cape_locations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.cape_locations ;;
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

  dimension: api_version {
    type: string
    sql: ${TABLE}."api_version" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: geocode_confidence {
    type: string
    sql: ${TABLE}."geocode_confidence" ;;
  }

  dimension: geocode_method {
    type: string
    sql: ${TABLE}."geocode_method" ;;
  }

  dimension: latlon {
    type: string
    sql: ${TABLE}."latlon" ;;
  }

  dimension: mccs_no_roof_occlusion {
    type: number
    sql: ${TABLE}."mccs_no_roof_occlusion" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_mccs_no_roof_occlusion {
    type: sum
    sql: ${mccs_no_roof_occlusion} ;;  }
  measure: average_mccs_no_roof_occlusion {
    type: average
    sql: ${mccs_no_roof_occlusion} ;;  }

  dimension: mccs_no_tree_overhang {
    type: number
    sql: ${TABLE}."mccs_no_tree_overhang" ;;
  }

  dimension: mccs_roof_condition_rating_excellent {
    type: number
    sql: ${TABLE}."mccs_roof_condition_rating_excellent" ;;
  }

  dimension: mccs_roof_condition_rating_fair {
    type: number
    sql: ${TABLE}."mccs_roof_condition_rating_fair" ;;
  }

  dimension: mccs_roof_condition_rating_good {
    type: number
    sql: ${TABLE}."mccs_roof_condition_rating_good" ;;
  }

  dimension: mccs_roof_condition_rating_poor {
    type: number
    sql: ${TABLE}."mccs_roof_condition_rating_poor" ;;
  }

  dimension: mccs_roof_condition_rating_severe {
    type: number
    sql: ${TABLE}."mccs_roof_condition_rating_severe" ;;
  }

  dimension: mccs_roof_condition_rating_unknown {
    type: number
    sql: ${TABLE}."mccs_roof_condition_rating_unknown" ;;
  }

  dimension: mccs_roof_geometry_flat {
    type: number
    sql: ${TABLE}."mccs_roof_geometry_flat" ;;
  }

  dimension: mccs_roof_geometry_gable {
    type: number
    sql: ${TABLE}."mccs_roof_geometry_gable" ;;
  }

  dimension: mccs_roof_geometry_hip {
    type: number
    sql: ${TABLE}."mccs_roof_geometry_hip" ;;
  }

  dimension: mccs_roof_geometry_mixed {
    type: number
    sql: ${TABLE}."mccs_roof_geometry_mixed" ;;
  }

  dimension: mccs_roof_geometry_unknown {
    type: number
    sql: ${TABLE}."mccs_roof_geometry_unknown" ;;
  }

  dimension: mccs_roof_occlusion_major {
    type: number
    sql: ${TABLE}."mccs_roof_occlusion_major" ;;
  }

  dimension: mccs_roof_occlusion_minor {
    type: number
    sql: ${TABLE}."mccs_roof_occlusion_minor" ;;
  }

  dimension: mccs_roof_occlusion_moderate {
    type: number
    sql: ${TABLE}."mccs_roof_occlusion_moderate" ;;
  }

  dimension: mccs_roof_occlusion_unknown {
    type: number
    sql: ${TABLE}."mccs_roof_occlusion_unknown" ;;
  }

  dimension: mccs_tree_overhang_major {
    type: number
    sql: ${TABLE}."mccs_tree_overhang_major" ;;
  }

  dimension: mccs_tree_overhang_minor {
    type: number
    sql: ${TABLE}."mccs_tree_overhang_minor" ;;
  }

  dimension: mccs_tree_overhang_moderate {
    type: number
    sql: ${TABLE}."mccs_tree_overhang_moderate" ;;
  }

  dimension: mccs_tree_overhang_unknown {
    type: number
    sql: ${TABLE}."mccs_tree_overhang_unknown" ;;
  }

  dimension: pool_enclosure {
    type: string
    sql: ${TABLE}."pool_enclosure" ;;
  }

  dimension: pool_presence {
    type: string
    sql: ${TABLE}."pool_presence" ;;
  }

  dimension: property_image_url {
    type: string
    sql: ${TABLE}."property_image_url" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: roof_condition {
    type: string
    sql: ${TABLE}."roof_condition" ;;
  }

  dimension: roof_condition_rating {
    type: string
    sql: ${TABLE}."roof_condition_rating" ;;
  }

  dimension_group: roof_condition_rating_capture {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."roof_condition_rating_capture_date" ;;
  }

  dimension: roof_covering_material {
    type: string
    sql: ${TABLE}."roof_covering_material" ;;
  }

  dimension: roof_covering_material_confidence {
    type: number
    sql: ${TABLE}."roof_covering_material_confidence" ;;
  }

  dimension: roof_extension {
    type: string
    sql: ${TABLE}."roof_extension" ;;
  }

  dimension: roof_occlusion {
    type: string
    sql: ${TABLE}."roof_occlusion" ;;
  }

  dimension: roof_shape_confidence {
    type: number
    sql: ${TABLE}."roof_shape_confidence" ;;
  }

  dimension: roof_solar_panel {
    type: string
    sql: ${TABLE}."roof_solar_panel" ;;
  }

  dimension: roof_type {
    type: string
    sql: ${TABLE}."roof_type" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: tree_overhang {
    type: string
    sql: ${TABLE}."tree_overhang" ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}."unique_id" ;;
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
