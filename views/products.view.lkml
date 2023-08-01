# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.products ;;
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

  dimension: administrated {
    type: yesno
    sql: ${TABLE}."administrated" ;;
  }

  dimension: building_kind {
    type: string
    sql: ${TABLE}."building_kind" ;;
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

  dimension_group: effective {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension: excess_and_surplus {
    type: yesno
    sql: ${TABLE}."excess_and_surplus" ;;
  }

  dimension: insurance_carrier_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."insurance_carrier_id" ;;
  }

  dimension: line {
    type: string
    sql: ${TABLE}."line" ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}."product_type" ;;
  }

  dimension: self_serve {
    type: yesno
    sql: ${TABLE}."self_serve" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	insurance_carriers.short_name,
	insurance_carriers.id,
	insurance_carriers.name,
	insurance_carriers.parent_name,
	bright_policies.count,
	bright_third_party_sales.count,
	insurance_scores.count,
	lifecycle_rules.count,
	packet_documents.count,
	product_deadlines.count,
	ratings.count,
	roof_eligibilities.count
	]
  }

}
