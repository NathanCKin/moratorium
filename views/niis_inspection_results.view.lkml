# The name of this view in Looker is "Niis Inspection Results"
view: niis_inspection_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.niis_inspection_results ;;
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
    # This dimension will be called "Adjacent Exposure Condition" in Explore.

  dimension: adjacent_exposure_condition {
    type: string
    sql: ${TABLE}."adjacent_exposure_condition" ;;
  }

  dimension: adjacent_exposure_flag {
    type: string
    sql: ${TABLE}."adjacent_exposure_flag" ;;
  }

  dimension: animals_condition {
    type: string
    sql: ${TABLE}."animals_condition" ;;
  }

  dimension: animals_flag {
    type: string
    sql: ${TABLE}."animals_flag" ;;
  }

  dimension: brush_w_in_1_4_mile_flag {
    type: string
    sql: ${TABLE}."brush_w_in_1_4_mile_flag" ;;
  }

  dimension: business_condition {
    type: string
    sql: ${TABLE}."business_condition" ;;
  }

  dimension: business_flag {
    type: string
    sql: ${TABLE}."business_flag" ;;
  }

  dimension: chimney_condition {
    type: string
    sql: ${TABLE}."chimney_condition" ;;
  }

  dimension: chimney_flag {
    type: string
    sql: ${TABLE}."chimney_flag" ;;
  }

  dimension: completion_code {
    type: string
    sql: ${TABLE}."completion_code" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: document_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."document_id" ;;
  }

  dimension: dogs_condition {
    type: string
    sql: ${TABLE}."dogs_condition" ;;
  }

  dimension: dogs_flag {
    type: string
    sql: ${TABLE}."dogs_flag" ;;
  }

  dimension: doors_condition {
    type: string
    sql: ${TABLE}."doors_condition" ;;
  }

  dimension: doors_flag {
    type: string
    sql: ${TABLE}."doors_flag" ;;
  }

  dimension: driveway_condition {
    type: string
    sql: ${TABLE}."driveway_condition" ;;
  }

  dimension: driveway_flag {
    type: string
    sql: ${TABLE}."driveway_flag" ;;
  }

  dimension: east_continuous_brush {
    type: string
    sql: ${TABLE}."east_continuous_brush" ;;
  }

  dimension: east_degrees {
    type: string
    sql: ${TABLE}."east_degrees" ;;
  }

  dimension: east_direction {
    type: string
    sql: ${TABLE}."east_direction" ;;
  }

  dimension: east_distance {
    type: string
    sql: ${TABLE}."east_distance" ;;
  }

  dimension: east_distance_brush {
    type: string
    sql: ${TABLE}."east_distance_brush" ;;
  }

  dimension: eaves_soffits_condition {
    type: string
    sql: ${TABLE}."eaves_soffits_condition" ;;
  }

  dimension: eaves_soffits_flag {
    type: string
    sql: ${TABLE}."eaves_soffits_flag" ;;
  }

  dimension: equipment_access {
    type: string
    sql: ${TABLE}."equipment_access" ;;
  }

  dimension: equipment_condition {
    type: string
    sql: ${TABLE}."equipment_condition" ;;
  }

  dimension: fence_condition {
    type: string
    sql: ${TABLE}."fence_condition" ;;
  }

  dimension: fence_flag {
    type: string
    sql: ${TABLE}."fence_flag" ;;
  }

  dimension: fire_protection_condition {
    type: string
    sql: ${TABLE}."fire_protection_condition" ;;
  }

  dimension: fire_protection_flag {
    type: string
    sql: ${TABLE}."fire_protection_flag" ;;
  }

  dimension: foundation_condition {
    type: string
    sql: ${TABLE}."foundation_condition" ;;
  }

  dimension: foundation_flag {
    type: string
    sql: ${TABLE}."foundation_flag" ;;
  }

  dimension: gutters_condition {
    type: string
    sql: ${TABLE}."gutters_condition" ;;
  }

  dimension: gutters_flag {
    type: string
    sql: ${TABLE}."gutters_flag" ;;
  }

  dimension: horizontal_length {
    type: string
    sql: ${TABLE}."horizontal_length" ;;
  }

  dimension: inspection_order_id {
    type: number
    sql: ${TABLE}."inspection_order_id" ;;
  }

  dimension: interview_type {
    type: string
    sql: ${TABLE}."interview_type" ;;
  }

  dimension: major_count {
    type: number
    sql: ${TABLE}."major_count" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_major_count {
    type: sum
    sql: ${major_count} ;;  }
  measure: average_major_count {
    type: average
    sql: ${major_count} ;;  }

  dimension: minor_count {
    type: number
    sql: ${TABLE}."minor_count" ;;
  }

  dimension: north_continuous_brush {
    type: string
    sql: ${TABLE}."north_continuous_brush" ;;
  }

  dimension: north_degrees {
    type: string
    sql: ${TABLE}."north_degrees" ;;
  }

  dimension: north_direction {
    type: string
    sql: ${TABLE}."north_direction" ;;
  }

  dimension: north_distance {
    type: string
    sql: ${TABLE}."north_distance" ;;
  }

  dimension: north_distance_brush {
    type: string
    sql: ${TABLE}."north_distance_brush" ;;
  }

  dimension: occupancy_condition {
    type: string
    sql: ${TABLE}."occupancy_condition" ;;
  }

  dimension: occupancy_flag {
    type: string
    sql: ${TABLE}."occupancy_flag" ;;
  }

  dimension: other_condition {
    type: string
    sql: ${TABLE}."other_condition" ;;
  }

  dimension: other_flag {
    type: string
    sql: ${TABLE}."other_flag" ;;
  }

  dimension: pool_flag {
    type: string
    sql: ${TABLE}."pool_flag" ;;
  }

  dimension: pool_spa_condition {
    type: string
    sql: ${TABLE}."pool_spa_condition" ;;
  }

  dimension: pool_spa_type {
    type: string
    sql: ${TABLE}."pool_spa_type" ;;
  }

  dimension: porch_condition {
    type: string
    sql: ${TABLE}."porch_condition" ;;
  }

  dimension: porch_flag {
    type: string
    sql: ${TABLE}."porch_flag" ;;
  }

  dimension: report_type {
    type: string
    sql: ${TABLE}."report_type" ;;
  }

  dimension: risk_rating {
    type: string
    sql: ${TABLE}."risk_rating" ;;
  }

  dimension: risk_rating_detail {
    type: string
    sql: ${TABLE}."risk_rating_detail" ;;
  }

  dimension: roof_materials_condition {
    type: string
    sql: ${TABLE}."roof_materials_condition" ;;
  }

  dimension: roof_materials_flag {
    type: string
    sql: ${TABLE}."roof_materials_flag" ;;
  }

  dimension: sidewalk_condition {
    type: string
    sql: ${TABLE}."sidewalk_condition" ;;
  }

  dimension: sidewalk_flag {
    type: string
    sql: ${TABLE}."sidewalk_flag" ;;
  }

  dimension: siding_paint_condition {
    type: string
    sql: ${TABLE}."siding_paint_condition" ;;
  }

  dimension: siding_paint_flag {
    type: string
    sql: ${TABLE}."siding_paint_flag" ;;
  }

  dimension: slope_at_foundation_flag {
    type: string
    sql: ${TABLE}."slope_at_foundation_flag" ;;
  }

  dimension: slope_calc {
    type: string
    sql: ${TABLE}."slope_calc" ;;
  }

  dimension: slope_greater_than_15_degrees_100_feet_flag {
    type: string
    sql: ${TABLE}."slope_greater_than_15_degrees_100_feet_flag" ;;
  }

  dimension: south_continuous_brush {
    type: string
    sql: ${TABLE}."south_continuous_brush" ;;
  }

  dimension: south_degrees {
    type: string
    sql: ${TABLE}."south_degrees" ;;
  }

  dimension: south_direction {
    type: string
    sql: ${TABLE}."south_direction" ;;
  }

  dimension: south_distance {
    type: string
    sql: ${TABLE}."south_distance" ;;
  }

  dimension: south_distance_brush {
    type: string
    sql: ${TABLE}."south_distance_brush" ;;
  }

  dimension: steps_condition {
    type: string
    sql: ${TABLE}."steps_condition" ;;
  }

  dimension: steps_flag {
    type: string
    sql: ${TABLE}."steps_flag" ;;
  }

  dimension: trees_condition {
    type: string
    sql: ${TABLE}."trees_condition" ;;
  }

  dimension: trees_flag {
    type: string
    sql: ${TABLE}."trees_flag" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: vertical_rise {
    type: string
    sql: ${TABLE}."vertical_rise" ;;
  }

  dimension: west_continuous_brush {
    type: string
    sql: ${TABLE}."west_continuous_brush" ;;
  }

  dimension: west_degrees {
    type: string
    sql: ${TABLE}."west_degrees" ;;
  }

  dimension: west_direction {
    type: string
    sql: ${TABLE}."west_direction" ;;
  }

  dimension: west_distance {
    type: string
    sql: ${TABLE}."west_distance" ;;
  }

  dimension: west_distance_brush {
    type: string
    sql: ${TABLE}."west_distance_brush" ;;
  }

  dimension: windows_condition {
    type: string
    sql: ${TABLE}."windows_condition" ;;
  }

  dimension: windows_flag {
    type: string
    sql: ${TABLE}."windows_flag" ;;
  }

  dimension: yard_condition {
    type: string
    sql: ${TABLE}."yard_condition" ;;
  }

  dimension: yard_flag {
    type: string
    sql: ${TABLE}."yard_flag" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, documents.id, inspection_photos.count, niis_inspection_result_raw_responses.count]
  }
}
