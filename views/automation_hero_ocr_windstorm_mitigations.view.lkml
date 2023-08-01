# The name of this view in Looker is "Automation Hero Ocr Windstorm Mitigations"
view: automation_hero_ocr_windstorm_mitigations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.automation_hero_ocr_windstorm_mitigations ;;
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
    # This dimension will be called "Bright Policy ID" in Explore.

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
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

  dimension: opening_protection {
    type: string
    sql: ${TABLE}."opening_protection" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: roof_deck {
    type: string
    sql: ${TABLE}."roof_deck" ;;
  }

  dimension: roof_material {
    type: string
    sql: ${TABLE}."roof_material" ;;
  }

  dimension: roof_shape {
    type: string
    sql: ${TABLE}."roof_shape" ;;
  }

  dimension: roof_wall_connection {
    type: string
    sql: ${TABLE}."roof_wall_connection" ;;
  }

  dimension: roof_year {
    type: number
    sql: ${TABLE}."roof_year" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_roof_year {
    type: sum
    sql: ${roof_year} ;;  }
  measure: average_roof_year {
    type: average
    sql: ${roof_year} ;;  }

  dimension: secondary_water_resistance {
    type: yesno
    sql: ${TABLE}."secondary_water_resistance" ;;
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
