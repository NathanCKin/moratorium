# The name of this view in Looker is "Underwriting Decisions"
view: underwriting_decisions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.underwriting_decisions ;;
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

  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
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

  dimension: manual {
    type: yesno
    sql: ${TABLE}."manual" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: pass {
    type: yesno
    sql: ${TABLE}."pass" ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}."result" ;;
  }

  dimension: revision {
    type: string
    sql: ${TABLE}."revision" ;;
  }

  dimension: rule_overridden {
    type: string
    sql: ${TABLE}."rule_overridden" ;;
  }

  dimension: rules_failed {
    type: string
    sql: ${TABLE}."rules_failed" ;;
  }

  dimension: rules_passed {
    type: string
    sql: ${TABLE}."rules_passed" ;;
  }

  dimension: rules_requiring_action {
    type: string
    sql: ${TABLE}."rules_requiring_action" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, users.id]
  }
}
