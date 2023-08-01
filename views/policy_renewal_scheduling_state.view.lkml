# The name of this view in Looker is "Policy Renewal Scheduling State"
view: policy_renewal_scheduling_state {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.policy_renewal_scheduling_state ;;
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
    # This dimension will be called "Data" in Explore.

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: policy_aggregate_root_id {
    type: string
    sql: ${TABLE}."policy_aggregate_root_id" ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}."term" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_term {
    type: sum
    sql: ${term} ;;  }
  measure: average_term {
    type: average
    sql: ${term} ;;  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
