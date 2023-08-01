# The name of this view in Looker is "Wildfire Mitigation Discounts"
view: wildfire_mitigation_discounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.wildfire_mitigation_discounts ;;
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
    # This dimension will be called "Annual Brush Removal Contract" in Explore.

  dimension: annual_brush_removal_contract {
    type: string
    sql: ${TABLE}."annual_brush_removal_contract" ;;
  }

  dimension: ember_resistant_venting {
    type: string
    sql: ${TABLE}."ember_resistant_venting" ;;
  }

  dimension: enclosed_eaves {
    type: string
    sql: ${TABLE}."enclosed_eaves" ;;
  }

  dimension: exterior_sprinklers {
    type: string
    sql: ${TABLE}."exterior_sprinklers" ;;
  }

  dimension: firewise_community {
    type: string
    sql: ${TABLE}."firewise_community" ;;
  }

  dimension: monitored_heat_sensors {
    type: string
    sql: ${TABLE}."monitored_heat_sensors" ;;
  }

  dimension: permanently_installed_wildfire_spray_system {
    type: string
    sql: ${TABLE}."permanently_installed_wildfire_spray_system" ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}."property_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
