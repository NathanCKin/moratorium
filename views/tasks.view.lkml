# The name of this view in Looker is "Tasks"
view: tasks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.tasks ;;
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
    # This dimension will be called "Csr ID" in Explore.

  dimension: csr_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."csr_id" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension_group: due_datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."due_datetime" ;;
  }

  dimension: five_nine_key {
    type: number
    sql: ${TABLE}."five_nine_key" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_five_nine_key {
    type: sum
    sql: ${five_nine_key} ;;  }
  measure: average_five_nine_key {
    type: average
    sql: ${five_nine_key} ;;  }

  dimension: google_calendar_event_id {
    type: string
    sql: ${TABLE}."google_calendar_event_id" ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}."outcome" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: policy_id {
    type: number
    sql: ${TABLE}."policy_id" ;;
  }

  dimension: policy_type {
    type: string
    sql: ${TABLE}."policy_type" ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}."reason" ;;
  }

  dimension: task_type {
    type: string
    sql: ${TABLE}."task_type" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, csrs.display_name, csrs.id]
  }
}
