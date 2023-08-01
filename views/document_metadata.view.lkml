# The name of this view in Looker is "Document Metadata"
view: document_metadata {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.document_metadata ;;
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
    # This dimension will be called "After Create Document Params" in Explore.

  dimension: after_create_document_params {
    type: string
    sql: ${TABLE}."after_create_document_params" ;;
  }

  dimension: after_generation_actions {
    type: string
    sql: ${TABLE}."after_generation_actions" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: document_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."document_id" ;;
  }

  dimension: document_schema {
    type: string
    sql: ${TABLE}."document_schema" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, documents.id]
  }
}
