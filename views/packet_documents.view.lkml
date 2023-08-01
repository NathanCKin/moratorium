# The name of this view in Looker is "Packet Documents"
view: packet_documents {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.packet_documents ;;
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

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Document Name" in Explore.

  dimension: document_name {
    type: string
    sql: ${TABLE}."document_name" ;;
  }

  dimension: form_number {
    type: string
    sql: ${TABLE}."form_number" ;;
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

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."product_id" ;;
  }

  dimension: static_document_template_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."static_document_template_id" ;;
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
  measure: count {
    type: count
    drill_fields: [id, document_name, static_document_templates.id, products.id]
  }
}
