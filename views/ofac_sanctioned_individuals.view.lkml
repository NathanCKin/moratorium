# The name of this view in Looker is "Ofac Sanctioned Individuals"
view: ofac_sanctioned_individuals {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.ofac_sanctioned_individuals ;;
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

  dimension_group: dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dob" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Has Usa Address" in Explore.

  dimension: has_usa_address {
    type: yesno
    sql: ${TABLE}."has_usa_address" ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}."list_name" ;;
  }

  dimension: names {
    type: string
    sql: ${TABLE}."names" ;;
  }

  dimension: ofac_id {
    type: number
    sql: ${TABLE}."ofac_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, list_name, ofac_sanctioned_matches.count]
  }
}
