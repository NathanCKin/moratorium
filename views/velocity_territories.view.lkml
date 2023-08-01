# The name of this view in Looker is "Velocity Territories"
view: velocity_territories {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.velocity_territories ;;
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
    # This dimension will be called "Aop Territory" in Explore.

  dimension: aop_territory {
    type: string
    sql: ${TABLE}."aop_territory" ;;
  }

  dimension: census_block_group {
    type: string
    sql: ${TABLE}."census_block_group" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: hurricane_territory {
    type: string
    sql: ${TABLE}."hurricane_territory" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
