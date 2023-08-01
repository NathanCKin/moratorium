# The name of this view in Looker is "Five Nine Agent States"
view: five_nine_agent_states {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.five_nine_agent_states ;;
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
    # This dimension will be called "Agent Email" in Explore.

  dimension: agent_email {
    type: string
    sql: ${TABLE}."agent_email" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: date_and_hour {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."date_and_hour" ;;
  }

  dimension: login_time {
    type: string
    sql: ${TABLE}."login_time" ;;
  }

  dimension: not_ready_time {
    type: string
    sql: ${TABLE}."not_ready_time" ;;
  }

  dimension: on_acw_time {
    type: string
    sql: ${TABLE}."on_acw_time" ;;
  }

  dimension: on_call_time {
    type: string
    sql: ${TABLE}."on_call_time" ;;
  }

  dimension: ready_time {
    type: string
    sql: ${TABLE}."ready_time" ;;
  }

  dimension: ringing_time {
    type: string
    sql: ${TABLE}."ringing_time" ;;
  }

  dimension: skill {
    type: string
    sql: ${TABLE}."skill" ;;
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
