# The name of this view in Looker is "Ratings"
view: ratings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.ratings ;;
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
    # This dimension will be called "Bright Policy ID" in Explore.

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: config {
    type: string
    sql: ${TABLE}."config" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: input {
    type: string
    sql: ${TABLE}."input" ;;
  }

  dimension: output {
    type: string
    sql: ${TABLE}."output" ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: total_premium_cents {
    type: number
    sql: ${TABLE}."total_premium_cents" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_premium_cents {
    type: sum
    sql: ${total_premium_cents} ;;  }
  measure: average_total_premium_cents {
    type: average
    sql: ${total_premium_cents} ;;  }

  dimension: total_premium_currency {
    type: string
    sql: ${TABLE}."total_premium_currency" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}."version" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	products.id,
	csr_quotes.count,
	custom_quotes.count,
	historical_policy_ratings.count,
	policy_events.count
	]
  }

}
