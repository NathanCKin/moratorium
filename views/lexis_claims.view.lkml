# The name of this view in Looker is "Lexis Claims"
view: lexis_claims {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.lexis_claims ;;
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
    # This dimension will be called "Catastrophe" in Explore.

  dimension: catastrophe {
    type: yesno
    sql: ${TABLE}."catastrophe" ;;
  }

  dimension: catastrophe_indicator {
    type: string
    sql: ${TABLE}."catastrophe_indicator" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: claim {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."claim_date" ;;
  }

  dimension: claim_type {
    type: string
    sql: ${TABLE}."claim_type" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: full_scope {
    type: yesno
    sql: ${TABLE}."full_scope" ;;
  }

  dimension: liability {
    type: yesno
    sql: ${TABLE}."liability" ;;
  }

  dimension: ncf_id {
    type: number
    sql: ${TABLE}."ncf_id" ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}."payment_amount" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_payment_amount {
    type: sum
    sql: ${payment_amount} ;;  }
  measure: average_payment_amount {
    type: average
    sql: ${payment_amount} ;;  }

  dimension: scope {
    type: string
    sql: ${TABLE}."scope" ;;
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
