# The name of this view in Looker is "Documents"
view: documents {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.documents ;;
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

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Display Name Override" in Explore.

  dimension: display_name_override {
    type: string
    sql: ${TABLE}."display_name_override" ;;
  }

  dimension: docset_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."docset_id" ;;
  }

  dimension: documentable_id {
    type: number
    sql: ${TABLE}."documentable_id" ;;
  }

  dimension: documentable_type {
    type: string
    sql: ${TABLE}."documentable_type" ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}."label" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: review_status {
    type: string
    sql: ${TABLE}."review_status" ;;
  }

  dimension: reviewed_by {
    type: string
    sql: ${TABLE}."reviewed_by" ;;
  }

  dimension: show_in_portal {
    type: yesno
    sql: ${TABLE}."show_in_portal" ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}."signature" ;;
  }

  dimension_group: signed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."signed_at" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
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

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: uploaded_by_id {
    type: number
    sql: ${TABLE}."uploaded_by_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	docsets.id,
	document_metadata.count,
	niis_inspection_results.count,
	policy_applications.count,
	policy_packets.count
	]
  }

}
