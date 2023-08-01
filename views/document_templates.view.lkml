# The name of this view in Looker is "Document Templates"
view: document_templates {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.document_templates ;;
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
    # This dimension will be called "Approved" in Explore.

  dimension: approved {
    type: yesno
    sql: ${TABLE}."approved" ;;
  }

  dimension: approved_by {
    type: number
    sql: ${TABLE}."approved_by" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_approved_by {
    type: sum
    sql: ${approved_by} ;;  }
  measure: average_approved_by {
    type: average
    sql: ${approved_by} ;;  }
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

  dimension: document_text {
    type: string
    sql: ${TABLE}."document_text" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}."section" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}."version" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, consents.count]
  }
}
