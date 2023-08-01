# The name of this view in Looker is "Verisk Fire Lines"
view: verisk_fire_lines {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.verisk_fire_lines ;;
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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: error_info {
    type: string
    sql: ${TABLE}."error_info" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: response {
    type: string
    sql: ${TABLE}."response" ;;
  }

  dimension: special_hazard_interface_area {
    type: string
    sql: ${TABLE}."special_hazard_interface_area" ;;
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

  dimension: wildfire_risk_score {
    type: number
    sql: ${TABLE}."wildfire_risk_score" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_wildfire_risk_score {
    type: sum
    sql: ${wildfire_risk_score} ;;  }
  measure: average_wildfire_risk_score {
    type: average
    sql: ${wildfire_risk_score} ;;  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
