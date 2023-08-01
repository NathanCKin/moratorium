# The name of this view in Looker is "Custom Quotes"
view: custom_quotes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.custom_quotes ;;
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

  dimension: coverage_attributes {
    type: string
    sql: ${TABLE}."coverage_attributes" ;;
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

  dimension: is_package {
    type: yesno
    sql: ${TABLE}."is_package" ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}."memo" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: not_valid {
    type: yesno
    sql: ${TABLE}."not_valid" ;;
  }

  dimension: not_valid_reason {
    type: string
    sql: ${TABLE}."not_valid_reason" ;;
  }

  dimension: property_attributes {
    type: string
    sql: ${TABLE}."property_attributes" ;;
  }

  dimension: rating_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."rating_id" ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}."tier" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: visible_to {
    type: string
    sql: ${TABLE}."visible_to" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, ratings.id, bright_policies.count]
  }
}
