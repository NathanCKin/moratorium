# The name of this view in Looker is "Blockers"
view: blockers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.blockers ;;
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
    # This dimension will be called "Blocked Stage" in Explore.

  dimension: blocked_stage {
    type: string
    sql: ${TABLE}."blocked_stage" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: completed_by_id {
    type: number
    sql: ${TABLE}."completed_by_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: documentation_required {
    type: yesno
    sql: ${TABLE}."documentation_required" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: required_document {
    type: string
    sql: ${TABLE}."required_document" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: user_actionable {
    type: yesno
    sql: ${TABLE}."user_actionable" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
