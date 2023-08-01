# The name of this view in Looker is "County Fips Mappings"
view: county_fips_mappings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.county_fips_mappings ;;
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
    # This dimension will be called "County" in Explore.

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }

  dimension: county_fips {
    type: string
    sql: ${TABLE}."county_fips" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
