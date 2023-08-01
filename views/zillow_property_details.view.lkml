# The name of this view in Looker is "Zillow Property Details"
view: zillow_property_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.zillow_property_details ;;
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

  dimension: bathrooms {
    type: number
    sql: ${TABLE}."bathrooms" ;;
  }

  dimension: county_fips {
    type: string
    sql: ${TABLE}."county_fips" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: home_sq_ft {
    type: number
    sql: ${TABLE}."home_sq_ft" ;;
  }

  dimension_group: last_sold {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."last_sold_date" ;;
  }

  dimension: last_sold_price {
    type: number
    sql: ${TABLE}."last_sold_price" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_last_sold_price {
    type: sum
    sql: ${last_sold_price} ;;  }
  measure: average_last_sold_price {
    type: average
    sql: ${last_sold_price} ;;  }

  dimension: latlon {
    type: string
    sql: ${TABLE}."latlon" ;;
  }

  dimension: property_sq_ft {
    type: number
    sql: ${TABLE}."property_sq_ft" ;;
  }

  dimension: property_type {
    type: string
    sql: ${TABLE}."property_type" ;;
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

  dimension: year_built {
    type: string
    sql: ${TABLE}."year_built" ;;
  }

  dimension: zillow_property_id {
    type: string
    sql: ${TABLE}."zillow_property_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, zillow_property_detail_updates.count]
  }
}
