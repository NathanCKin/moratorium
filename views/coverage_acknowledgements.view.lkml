# The name of this view in Looker is "Coverage Acknowledgements"
view: coverage_acknowledgements {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.coverage_acknowledgements ;;
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
    # This dimension will be called "Coverage ID" in Explore.

  dimension: coverage_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."coverage_id" ;;
  }

  dimension: customer_acknowledged {
    type: string
    sql: ${TABLE}."customer_acknowledged" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, coverages.id]
  }
}
