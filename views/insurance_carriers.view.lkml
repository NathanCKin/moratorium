# The name of this view in Looker is "Insurance Carriers"
view: insurance_carriers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.insurance_carriers ;;
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
    # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}."active" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: no_carrier {
    type: yesno
    sql: ${TABLE}."no_carrier" ;;
  }

  dimension: parent_name {
    type: string
    sql: ${TABLE}."parent_name" ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}."short_name" ;;
  }

  dimension: states {
    type: string
    sql: ${TABLE}."states" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}."verified" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	short_name,
	name,
	parent_name,
	external_policies.count,
	products.count
	]
  }

}
