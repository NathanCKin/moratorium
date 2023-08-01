# The name of this view in Looker is "Lexis Ncfs"
view: lexis_ncfs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.lexis_ncfs ;;
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
    # This dimension will be called "Clue Product Reference" in Explore.

  dimension: clue_product_reference {
    type: string
    sql: ${TABLE}."clue_product_reference" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}."error_code" ;;
  }

  dimension: exclusion_code {
    type: string
    sql: ${TABLE}."exclusion_code" ;;
  }

  dimension: exclusion_message {
    type: string
    sql: ${TABLE}."exclusion_message" ;;
  }

  dimension: ncf_product_reference {
    type: string
    sql: ${TABLE}."ncf_product_reference" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: prequal {
    type: yesno
    sql: ${TABLE}."prequal" ;;
  }

  dimension: quoteback {
    type: string
    sql: ${TABLE}."quoteback" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: reference_number {
    type: string
    sql: ${TABLE}."reference_number" ;;
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

  dimension: score_status {
    type: string
    sql: ${TABLE}."score_status" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: total_prior_inquiry_history {
    type: number
    sql: ${TABLE}."total_prior_inquiry_history" ;;
  }

  dimension: total_risk_claims {
    type: number
    sql: ${TABLE}."total_risk_claims" ;;
  }

  dimension: total_subject_claims {
    type: number
    sql: ${TABLE}."total_subject_claims" ;;
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
    drill_fields: [id]
  }
}
