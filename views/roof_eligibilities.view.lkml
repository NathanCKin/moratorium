# The name of this view in Looker is "Roof Eligibilities"
view: roof_eligibilities {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.roof_eligibilities ;;
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
    # This dimension will be called "Built Up Hot Mopped W Gravel" in Explore.

  dimension: built_up_hot_mopped_w_gravel {
    type: number
    sql: ${TABLE}."built_up_hot_mopped_w_gravel" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_built_up_hot_mopped_w_gravel {
    type: sum
    sql: ${built_up_hot_mopped_w_gravel} ;;  }
  measure: average_built_up_hot_mopped_w_gravel {
    type: average
    sql: ${built_up_hot_mopped_w_gravel} ;;  }

  dimension: built_up_hot_mopped_w_o_gravel {
    type: number
    sql: ${TABLE}."built_up_hot_mopped_w_o_gravel" ;;
  }

  dimension: composition_3_tab_shingle {
    type: number
    sql: ${TABLE}."composition_3_tab_shingle" ;;
  }

  dimension: composition_architectural_shingle {
    type: number
    sql: ${TABLE}."composition_architectural_shingle" ;;
  }

  dimension: composition_impact_resist_shingle {
    type: number
    sql: ${TABLE}."composition_impact_resist_shingle" ;;
  }

  dimension: composition_roll_roofing {
    type: number
    sql: ${TABLE}."composition_roll_roofing" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: membrane_epdm_or_pvc {
    type: number
    sql: ${TABLE}."membrane_epdm_or_pvc" ;;
  }

  dimension: metal_copper_shingle {
    type: number
    sql: ${TABLE}."metal_copper_shingle" ;;
  }

  dimension: metal_corrugated_galvanized {
    type: number
    sql: ${TABLE}."metal_corrugated_galvanized" ;;
  }

  dimension: metal_painted_rib {
    type: number
    sql: ${TABLE}."metal_painted_rib" ;;
  }

  dimension: metal_standing_seam {
    type: number
    sql: ${TABLE}."metal_standing_seam" ;;
  }

  dimension: metal_standing_seam_copper {
    type: number
    sql: ${TABLE}."metal_standing_seam_copper" ;;
  }

  dimension: metal_tile_shake {
    type: number
    sql: ${TABLE}."metal_tile_shake" ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  dimension: slate {
    type: number
    sql: ${TABLE}."slate" ;;
  }

  dimension: sprayed_polyurethane_foam {
    type: number
    sql: ${TABLE}."sprayed_polyurethane_foam" ;;
  }

  dimension: synthetic_composite_roofing {
    type: number
    sql: ${TABLE}."synthetic_composite_roofing" ;;
  }

  dimension: tile_cement_fiber {
    type: number
    sql: ${TABLE}."tile_cement_fiber" ;;
  }

  dimension: tile_clay {
    type: number
    sql: ${TABLE}."tile_clay" ;;
  }

  dimension: tile_concrete {
    type: number
    sql: ${TABLE}."tile_concrete" ;;
  }

  dimension: tile_glazed {
    type: number
    sql: ${TABLE}."tile_glazed" ;;
  }

  dimension: unknown {
    type: number
    sql: ${TABLE}."unknown" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: wood_shingles_or_shakes {
    type: number
    sql: ${TABLE}."wood_shingles_or_shakes" ;;
  }

  dimension: wood_shingles_shakes_deco_ptrn {
    type: number
    sql: ${TABLE}."wood_shingles_shakes_deco_ptrn" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, products.id]
  }
}
