# The name of this view in Looker is "Users Roles"
view: users_roles {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.users_roles ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Role ID" in Explore.

  dimension: role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."role_id" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [roles.name, roles.id, users.id]
  }
}
