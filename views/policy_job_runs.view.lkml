# The name of this view in Looker is "Policy Job Runs"
view: policy_job_runs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_job_runs ;;
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
    # This dimension will be called "Batch Job Run ID" in Explore.

  dimension: batch_job_run_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."batch_job_run_id" ;;
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}."bright_policy_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}."error_message" ;;
  }

  dimension: jobs_ran {
    type: string
    sql: ${TABLE}."jobs_ran" ;;
  }

  dimension: policy_event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."policy_event_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, policy_events.id, batch_job_runs.id]
  }
}
