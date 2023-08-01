# The name of this view in Looker is "Consents"
view: consents {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.consents ;;
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
    # This dimension will be called "Browser Metadata" in Explore.

  dimension: browser_metadata {
    type: string
    sql: ${TABLE}."browser_metadata" ;;
  }

  dimension: consented_to {
    type: string
    sql: ${TABLE}."consented_to" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: document_template_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."document_template_id" ;;
  }

  dimension_group: insurance_score_pull {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."insurance_score_pull_at" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension_group: receive_calls {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."receive_calls_at" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, users.id, document_templates.id, document_templates.name]
  }
}
