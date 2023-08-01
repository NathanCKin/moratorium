# The name of this view in Looker is "Crm Assignments"
view: crm_assignments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.crm_assignments ;;
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
    # This dimension will be called "Assigned to ID" in Explore.

  dimension: assigned_to_id {
    type: number
    sql: ${TABLE}."assigned_to_id" ;;
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

  dimension: crm_lead_status_id {
    type: number
    sql: ${TABLE}."crm_lead_status_id" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: legacy_csr_lead_id {
    type: number
    sql: ${TABLE}."legacy_csr_lead_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}."updated_by_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, crm_accounts.id]
  }
}
