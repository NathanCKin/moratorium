# The name of this view in Looker is "Schema Migrations"
view: schema_migrations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.schema_migrations ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Version" in Explore.

  dimension: version {
    type: string
    sql: ${TABLE}."version" ;;
  }
  measure: count {
    type: count
  }
}
