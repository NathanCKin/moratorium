# The name of this view in Looker is "Awsdms Ddl Audit"
view: awsdms_ddl_audit {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.awsdms_ddl_audit ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "C Ddlqry" in Explore.

  dimension: c_ddlqry {
    type: string
    sql: ${TABLE}."c_ddlqry" ;;
  }

  dimension: c_key {
    type: number
    sql: ${TABLE}."c_key" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_c_key {
    type: sum
    sql: ${c_key} ;;  }
  measure: average_c_key {
    type: average
    sql: ${c_key} ;;  }

  dimension: c_name {
    type: string
    sql: ${TABLE}."c_name" ;;
  }

  dimension: c_oid {
    type: number
    value_format_name: id
    sql: ${TABLE}."c_oid" ;;
  }

  dimension: c_schema {
    type: string
    sql: ${TABLE}."c_schema" ;;
  }

  dimension: c_tag {
    type: string
    sql: ${TABLE}."c_tag" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."c_time" ;;
  }

  dimension: c_txn {
    type: string
    sql: ${TABLE}."c_txn" ;;
  }

  dimension: c_user {
    type: string
    sql: ${TABLE}."c_user" ;;
  }
  measure: count {
    type: count
    drill_fields: [c_name]
  }
}
