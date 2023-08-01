# The name of this view in Looker is "Us Counties"
view: us_counties {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.us_counties ;;
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
    # This dimension will be called "Countyname" in Explore.

  dimension: countyname {
    type: string
    sql: ${TABLE}."countyname" ;;
  }

  dimension: cwa {
    type: string
    sql: ${TABLE}."cwa" ;;
  }

  dimension: fe_area {
    type: string
    sql: ${TABLE}."fe_area" ;;
  }

  dimension: fips {
    type: string
    sql: ${TABLE}."fips" ;;
  }

  dimension: geom {
    type: string
    sql: ${TABLE}."geom" ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}."lat" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_lat {
    type: sum
    sql: ${lat} ;;  }
  measure: average_lat {
    type: average
    sql: ${lat} ;;  }

  dimension: lon {
    type: number
    sql: ${TABLE}."lon" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}."time_zone" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, countyname]
  }
}
