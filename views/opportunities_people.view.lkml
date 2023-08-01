# The name of this view in Looker is "Opportunities People"
view: opportunities_people {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.opportunities_people ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Opportunity ID" in Explore.

  dimension: opportunity_id {
    type: number
    sql: ${TABLE}."opportunity_id" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }
  measure: count {
    type: count
  }
}
