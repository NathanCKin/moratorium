# The name of this view in Looker is "Organization Versions"
view: organization_versions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.organization_versions ;;
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
    # This dimension will be called "Event" in Explore.

  dimension: event {
    type: string
    sql: ${TABLE}."event" ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}."item_id" ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}."item_type" ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}."object" ;;
  }

  dimension: object_changes {
    type: string
    sql: ${TABLE}."object_changes" ;;
  }

  dimension: whodunnit {
    type: string
    sql: ${TABLE}."whodunnit" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
