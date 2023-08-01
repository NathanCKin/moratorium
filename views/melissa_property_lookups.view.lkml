# The name of this view in Looker is "Melissa Property Lookups"
view: melissa_property_lookups {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.melissa_property_lookups ;;
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

  dimension: address_key {
    type: string
    sql: ${TABLE}."address_key" ;;
  }

  dimension: bedrooms {
    type: number
    sql: ${TABLE}."bedrooms" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bedrooms {
    type: sum
    sql: ${bedrooms} ;;  }
  measure: average_bedrooms {
    type: average
    sql: ${bedrooms} ;;  }

  dimension: construction_code {
    type: string
    sql: ${TABLE}."construction_code" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: ext_wall_code {
    type: string
    sql: ${TABLE}."ext_wall_code" ;;
  }

  dimension: full_baths {
    type: number
    sql: ${TABLE}."full_baths" ;;
  }

  dimension: half_baths {
    type: number
    sql: ${TABLE}."half_baths" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }

  dimension: property_code {
    type: number
    sql: ${TABLE}."property_code" ;;
  }

  dimension: quality_code {
    type: string
    sql: ${TABLE}."quality_code" ;;
  }

  dimension: quarter_baths {
    type: number
    sql: ${TABLE}."quarter_baths" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: roof_cover {
    type: string
    sql: ${TABLE}."roof_cover" ;;
  }

  dimension_group: sale {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."sale_date" ;;
  }

  dimension: sale_price {
    type: string
    sql: ${TABLE}."sale_price" ;;
  }

  dimension: sq_ft {
    type: number
    sql: ${TABLE}."sq_ft" ;;
  }

  dimension: stories {
    type: number
    sql: ${TABLE}."stories" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: three_quarter_baths {
    type: number
    sql: ${TABLE}."three_quarter_baths" ;;
  }

  dimension: total_baths {
    type: number
    sql: ${TABLE}."total_baths" ;;
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
  measure: count {
    type: count
    drill_fields: [id]
  }
}
