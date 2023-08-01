# The name of this view in Looker is "Spatial Ref Sys"
view: spatial_ref_sys {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.spatial_ref_sys ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Auth Name" in Explore.

  dimension: auth_name {
    type: string
    sql: ${TABLE}."auth_name" ;;
  }

  dimension: auth_srid {
    type: number
    value_format_name: id
    sql: ${TABLE}."auth_srid" ;;
  }

  dimension: proj4text {
    type: string
    sql: ${TABLE}."proj4text" ;;
  }

  dimension: srid {
    type: number
    value_format_name: id
    sql: ${TABLE}."srid" ;;
  }

  dimension: srtext {
    type: string
    sql: ${TABLE}."srtext" ;;
  }
  measure: count {
    type: count
    drill_fields: [auth_name]
  }
}
