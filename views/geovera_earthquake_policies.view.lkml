# The name of this view in Looker is "Geovera Earthquake Policies"
view: geovera_earthquake_policies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.geovera_earthquake_policies ;;
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
    # This dimension will be called "Coverage A" in Explore.

  dimension: coverage_a {
    type: number
    sql: ${TABLE}."coverage_a" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_coverage_a {
    type: sum
    sql: ${coverage_a} ;;  }
  measure: average_coverage_a {
    type: average
    sql: ${coverage_a} ;;  }

  dimension: coverage_a_text {
    type: string
    sql: ${TABLE}."coverage_a_text" ;;
  }

  dimension: coverage_b {
    type: number
    sql: ${TABLE}."coverage_b" ;;
  }

  dimension: coverage_b_text {
    type: string
    sql: ${TABLE}."coverage_b_text" ;;
  }

  dimension: coverage_c {
    type: number
    sql: ${TABLE}."coverage_c" ;;
  }

  dimension: coverage_c_text {
    type: string
    sql: ${TABLE}."coverage_c_text" ;;
  }

  dimension: coverage_d {
    type: number
    sql: ${TABLE}."coverage_d" ;;
  }

  dimension: coverage_d_text {
    type: string
    sql: ${TABLE}."coverage_d_text" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: deductible {
    type: number
    sql: ${TABLE}."deductible" ;;
  }

  dimension: premium {
    type: number
    sql: ${TABLE}."premium" ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: quote_number {
    type: string
    sql: ${TABLE}."quote_number" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
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
  measure: count {
    type: count
    drill_fields: [id]
  }
}
