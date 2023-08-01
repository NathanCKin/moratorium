# The name of this view in Looker is "Product Deadlines"
view: product_deadlines {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.product_deadlines ;;
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
    # This dimension will be called "Cancellation Days" in Explore.

  dimension: cancellation_days {
    type: number
    sql: ${TABLE}."cancellation_days" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cancellation_days {
    type: sum
    sql: ${cancellation_days} ;;  }
  measure: average_cancellation_days {
    type: average
    sql: ${cancellation_days} ;;  }

  dimension: chargeable_loss_years {
    type: number
    sql: ${TABLE}."chargeable_loss_years" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: good_faith_credit_card_days {
    type: number
    sql: ${TABLE}."good_faith_credit_card_days" ;;
  }

  dimension: nonrenewal_days {
    type: number
    sql: ${TABLE}."nonrenewal_days" ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  dimension: reinstatement_days {
    type: number
    sql: ${TABLE}."reinstatement_days" ;;
  }

  dimension: renewal_days {
    type: number
    sql: ${TABLE}."renewal_days" ;;
  }

  dimension: renewal_flag_repull_days {
    type: number
    sql: ${TABLE}."renewal_flag_repull_days" ;;
  }

  dimension: repull_insurance_score_every_x_terms {
    type: number
    sql: ${TABLE}."repull_insurance_score_every_x_terms" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: uw_cancellation_days {
    type: number
    sql: ${TABLE}."uw_cancellation_days" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, products.id]
  }
}
