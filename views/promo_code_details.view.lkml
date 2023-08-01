# The name of this view in Looker is "Promo Code Details"
view: promo_code_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.promo_code_details ;;
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

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
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

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: promo_code {
    type: string
    sql: ${TABLE}."promo_code" ;;
  }

  dimension: promo_code_file_import_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."promo_code_file_import_id" ;;
  }

  dimension: raw_street_name {
    type: string
    sql: ${TABLE}."raw_street_name" ;;
  }

  dimension_group: send {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."send_date" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."zip" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, raw_street_name, promo_code_file_imports.id]
  }
}
