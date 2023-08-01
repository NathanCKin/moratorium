# The name of this view in Looker is "Database Metrics"
view: database_metrics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.database_metrics ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Largest Tables Table Name" in Explore.

  dimension: largest_tables_table_name {
    type: string
    sql: ${TABLE}."largest_tables_table_name" ;;
  }

  dimension: largest_tables_table_size {
    type: number
    sql: ${TABLE}."largest_tables_table_size" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_largest_tables_table_size {
    type: sum
    sql: ${largest_tables_table_size} ;;  }
  measure: average_largest_tables_table_size {
    type: average
    sql: ${largest_tables_table_size} ;;  }

  dimension: pg_database_size {
    type: number
    sql: ${TABLE}."pg_database_size" ;;
  }

  dimension: unused_index_count {
    type: number
    sql: ${TABLE}."unused_index_count" ;;
  }
  measure: count {
    type: count
    drill_fields: [largest_tables_table_name]
  }
}
