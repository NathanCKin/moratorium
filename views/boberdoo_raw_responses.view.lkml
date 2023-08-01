# The name of this view in Looker is "Boberdoo Raw Responses"
view: boberdoo_raw_responses {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.boberdoo_raw_responses ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: lead_id_token {
    type: string
    sql: ${TABLE}."lead_id_token" ;;
  }

  dimension: occupancy {
    type: string
    sql: ${TABLE}."occupancy" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: raw_response {
    type: string
    sql: ${TABLE}."raw_response" ;;
  }

  dimension: reject_reason {
    type: string
    sql: ${TABLE}."reject_reason" ;;
  }

  dimension_group: rejected {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."rejected_at" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
