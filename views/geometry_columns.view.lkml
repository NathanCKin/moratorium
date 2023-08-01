# The name of this view in Looker is "Geometry Columns"
view: geometry_columns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.geometry_columns ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Coord Dimension" in Explore.

  dimension: coord_dimension {
    type: number
    sql: ${TABLE}."coord_dimension" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_coord_dimension {
    type: sum
    sql: ${coord_dimension} ;;  }
  measure: average_coord_dimension {
    type: average
    sql: ${coord_dimension} ;;  }

  dimension: f_geometry_column {
    type: string
    sql: ${TABLE}."f_geometry_column" ;;
  }

  dimension: f_table_catalog {
    type: string
    sql: ${TABLE}."f_table_catalog" ;;
  }

  dimension: f_table_name {
    type: string
    sql: ${TABLE}."f_table_name" ;;
  }

  dimension: f_table_schema {
    type: string
    sql: ${TABLE}."f_table_schema" ;;
  }

  dimension: srid {
    type: number
    value_format_name: id
    sql: ${TABLE}."srid" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  measure: count {
    type: count
    drill_fields: [f_table_name]
  }
}
