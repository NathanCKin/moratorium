# The name of this view in Looker is "Estated Property Details"
view: estated_property_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.estated_property_details ;;
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_acreage {
    type: sum
    sql: ${acreage} ;;  }
  measure: average_acreage {
    type: average
    sql: ${acreage} ;;  }

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: basement_type {
    type: string
    sql: ${TABLE}."basement_type" ;;
  }

  dimension: bathrooms {
    type: number
    sql: ${TABLE}."bathrooms" ;;
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

  dimension: exterior_wall_type {
    type: string
    sql: ${TABLE}."exterior_wall_type" ;;
  }

  dimension: foundation {
    type: string
    sql: ${TABLE}."foundation" ;;
  }

  dimension: owners {
    type: string
    sql: ${TABLE}."owners" ;;
  }

  dimension: pool {
    type: string
    sql: ${TABLE}."pool" ;;
  }

  dimension: property_type {
    type: string
    sql: ${TABLE}."property_type" ;;
  }

  dimension_group: purchase {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."purchase_date" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: roof_style_type {
    type: string
    sql: ${TABLE}."roof_style_type" ;;
  }

  dimension: roof_type {
    type: string
    sql: ${TABLE}."roof_type" ;;
  }

  dimension: square_feet {
    type: number
    sql: ${TABLE}."square_feet" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
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

  dimension: year_built {
    type: number
    sql: ${TABLE}."year_built" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
