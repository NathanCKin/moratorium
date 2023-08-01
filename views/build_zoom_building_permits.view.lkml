# The name of this view in Looker is "Build Zoom Building Permits"
view: build_zoom_building_permits {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.build_zoom_building_permits ;;
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
    # This dimension will be called "Address ID" in Explore.

  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }

  dimension: build_zoom_building_permit_list_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."build_zoom_building_permit_list_id" ;;
  }

  dimension: build_zoom_permit_id {
    type: string
    sql: ${TABLE}."build_zoom_permit_id" ;;
  }

  dimension: build_zoom_property_id {
    type: string
    sql: ${TABLE}."build_zoom_property_id" ;;
  }

  dimension: contractor {
    type: string
    sql: ${TABLE}."contractor" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."effective_date" ;;
  }

  dimension: job_value {
    type: number
    sql: ${TABLE}."job_value" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_job_value {
    type: sum
    sql: ${job_value} ;;  }
  measure: average_job_value {
    type: average
    sql: ${job_value} ;;  }

  dimension: permit_number {
    type: string
    sql: ${TABLE}."permit_number" ;;
  }

  dimension: permit_subtype {
    type: string
    sql: ${TABLE}."permit_subtype" ;;
  }

  dimension: permit_type {
    type: string
    sql: ${TABLE}."permit_type" ;;
  }

  dimension: project_types {
    type: string
    sql: ${TABLE}."project_types" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
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
    drill_fields: [id, build_zoom_building_permit_lists.id]
  }
}
