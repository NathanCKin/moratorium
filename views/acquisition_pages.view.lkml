# The name of this view in Looker is "Acquisition Pages"
view: acquisition_pages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.acquisition_pages ;;
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
    # This dimension will be called "Acquisition Flow ID" in Explore.

  dimension: acquisition_flow_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."acquisition_flow_id" ;;
  }

  dimension: button_text {
    type: string
    sql: ${TABLE}."button_text" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: experiments {
    type: string
    sql: ${TABLE}."experiments" ;;
  }

  dimension: layout {
    type: string
    sql: ${TABLE}."layout" ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}."order" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_order {
    type: sum
    sql: ${order} ;;  }
  measure: average_order {
    type: average
    sql: ${order} ;;  }

  dimension: path {
    type: string
    sql: ${TABLE}."path" ;;
  }

  dimension: screenshot_key {
    type: string
    sql: ${TABLE}."screenshot_key" ;;
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}."subtitle" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, acquisition_flows.name, acquisition_flows.id, acquisition_page_components.count]
  }
}
