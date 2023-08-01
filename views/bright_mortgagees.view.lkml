# The name of this view in Looker is "Bright Mortgagees"
view: bright_mortgagees {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.bright_mortgagees ;;
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
    # This dimension will be called "Address1" in Explore.

  dimension: address1 {
    type: string
    sql: ${TABLE}."address1" ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}."address2" ;;
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

  dimension: customer_facing_name {
    type: string
    sql: ${TABLE}."customer_facing_name" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}."fax" ;;
  }

  dimension: mortgagee_clause {
    type: string
    sql: ${TABLE}."mortgagee_clause" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: no_mortgagee {
    type: yesno
    sql: ${TABLE}."no_mortgagee" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: successors {
    type: string
    sql: ${TABLE}."successors" ;;
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
    drill_fields: [id, customer_facing_name, name]
  }
}
