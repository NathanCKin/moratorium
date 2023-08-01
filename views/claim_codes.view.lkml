# The name of this view in Looker is "Claim Codes"
view: claim_codes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.claim_codes ;;
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
    # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: loss_category {
    type: string
    sql: ${TABLE}."loss_category" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: weather_indicator {
    type: yesno
    sql: ${TABLE}."weather_indicator" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
