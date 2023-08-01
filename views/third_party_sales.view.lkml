# The name of this view in Looker is "Third Party Sales"
view: third_party_sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.third_party_sales ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: bound {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."bound_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bound By ID" in Explore.

  dimension: bound_by_id {
    type: number
    sql: ${TABLE}."bound_by_id" ;;
  }

  dimension: bound_premium {
    type: number
    sql: ${TABLE}."bound_premium" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bound_premium {
    type: sum
    sql: ${bound_premium} ;;  }
  measure: average_bound_premium {
    type: average
    sql: ${bound_premium} ;;  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}."cancelled" ;;
  }

  dimension: cancelled_by_id {
    type: number
    sql: ${TABLE}."cancelled_by_id" ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}."carrier" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."external_id" ;;
  }

  dimension: line {
    type: string
    sql: ${TABLE}."line" ;;
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
