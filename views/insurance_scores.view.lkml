# The name of this view in Looker is "Insurance Scores"
view: insurance_scores {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.insurance_scores ;;
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

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "External Reference ID" in Explore.

  dimension: external_reference_id {
    type: string
    sql: ${TABLE}."external_reference_id" ;;
  }

  dimension: info {
    type: string
    sql: ${TABLE}."info" ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}."model" ;;
  }

  dimension: no_hit {
    type: yesno
    sql: ${TABLE}."no_hit" ;;
  }

  dimension: no_score_status {
    type: yesno
    sql: ${TABLE}."no_score_status" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: prequal {
    type: yesno
    sql: ${TABLE}."prequal" ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."score" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_score {
    type: sum
    sql: ${score} ;;  }
  measure: average_score {
    type: average
    sql: ${score} ;;  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}."transaction_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, products.id]
  }
}
