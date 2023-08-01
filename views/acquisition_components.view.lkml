# The name of this view in Looker is "Acquisition Components"
view: acquisition_components {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.acquisition_components ;;
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
    # This dimension will be called "Act As Flag" in Explore.

  dimension: act_as_flag {
    type: yesno
    sql: ${TABLE}."act_as_flag" ;;
  }

  dimension: attribute_name {
    type: string
    sql: ${TABLE}."attribute_name" ;;
  }

  dimension: author {
    type: string
    sql: ${TABLE}."author" ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}."content" ;;
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

  dimension: help_text {
    type: string
    sql: ${TABLE}."help_text" ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}."label" ;;
  }

  dimension: lifecycle_field {
    type: string
    sql: ${TABLE}."lifecycle_field" ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}."parent_id" ;;
  }

  dimension: select_options {
    type: string
    sql: ${TABLE}."select_options" ;;
  }

  dimension: show_when_parent {
    type: string
    sql: ${TABLE}."show_when_parent" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: validations {
    type: string
    sql: ${TABLE}."validations" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attribute_name, acquisition_page_components.count]
  }
}
