# The name of this view in Looker is "Notes"
view: notes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.notes ;;
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
    # This dimension will be called "Body" in Explore.

  dimension: body {
    type: string
    sql: ${TABLE}."body" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}."hidden" ;;
  }

  dimension: legacy_comment_id {
    type: number
    sql: ${TABLE}."legacy_comment_id" ;;
  }

  dimension: notable_id {
    type: number
    sql: ${TABLE}."notable_id" ;;
  }

  dimension: notable_type {
    type: string
    sql: ${TABLE}."notable_type" ;;
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
