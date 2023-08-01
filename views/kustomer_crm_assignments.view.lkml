# The name of this view in Looker is "Kustomer Crm Assignments"
view: kustomer_crm_assignments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.kustomer_crm_assignments ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Assigned to ID" in Explore.

  dimension: assigned_to_id {
    type: number
    sql: ${TABLE}."assigned_to_id" ;;
  }

  dimension: assignment_id {
    type: number
    sql: ${TABLE}."assignment_id" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: crm_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."crm_account_id" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: lost_details {
    type: string
    sql: ${TABLE}."lost_details" ;;
  }

  dimension: lost_reason {
    type: string
    sql: ${TABLE}."lost_reason" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: rep_display_name {
    type: string
    sql: ${TABLE}."rep_display_name" ;;
  }

  dimension: rep_email {
    type: string
    sql: ${TABLE}."rep_email" ;;
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
    drill_fields: [rep_display_name, crm_accounts.id]
  }
}
