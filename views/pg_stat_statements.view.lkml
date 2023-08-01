# The name of this view in Looker is "Pg Stat Statements"
view: pg_stat_statements {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.pg_stat_statements ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Blk Read Time" in Explore.

  dimension: blk_read_time {
    type: number
    sql: ${TABLE}."blk_read_time" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_blk_read_time {
    type: sum
    sql: ${blk_read_time} ;;  }
  measure: average_blk_read_time {
    type: average
    sql: ${blk_read_time} ;;  }

  dimension: blk_write_time {
    type: number
    sql: ${TABLE}."blk_write_time" ;;
  }

  dimension: calls {
    type: number
    sql: ${TABLE}."calls" ;;
  }

  dimension: dbid {
    type: string
    sql: ${TABLE}."dbid" ;;
  }

  dimension: local_blks_dirtied {
    type: number
    sql: ${TABLE}."local_blks_dirtied" ;;
  }

  dimension: local_blks_hit {
    type: number
    sql: ${TABLE}."local_blks_hit" ;;
  }

  dimension: local_blks_read {
    type: number
    sql: ${TABLE}."local_blks_read" ;;
  }

  dimension: local_blks_written {
    type: number
    sql: ${TABLE}."local_blks_written" ;;
  }

  dimension: max_time {
    type: number
    sql: ${TABLE}."max_time" ;;
  }

  dimension: mean_time {
    type: number
    sql: ${TABLE}."mean_time" ;;
  }

  dimension: min_time {
    type: number
    sql: ${TABLE}."min_time" ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}."query" ;;
  }

  dimension: queryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."queryid" ;;
  }

  dimension: rows {
    type: number
    sql: ${TABLE}."rows" ;;
  }

  dimension: shared_blks_dirtied {
    type: number
    sql: ${TABLE}."shared_blks_dirtied" ;;
  }

  dimension: shared_blks_hit {
    type: number
    sql: ${TABLE}."shared_blks_hit" ;;
  }

  dimension: shared_blks_read {
    type: number
    sql: ${TABLE}."shared_blks_read" ;;
  }

  dimension: shared_blks_written {
    type: number
    sql: ${TABLE}."shared_blks_written" ;;
  }

  dimension: stddev_time {
    type: number
    sql: ${TABLE}."stddev_time" ;;
  }

  dimension: temp_blks_read {
    type: number
    sql: ${TABLE}."temp_blks_read" ;;
  }

  dimension: temp_blks_written {
    type: number
    sql: ${TABLE}."temp_blks_written" ;;
  }

  dimension: total_time {
    type: number
    sql: ${TABLE}."total_time" ;;
  }

  dimension: userid {
    type: string
    # hidden: yes
    sql: ${TABLE}."userid" ;;
  }
  measure: count {
    type: count
    drill_fields: [users.id]
  }
}
