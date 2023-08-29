
view: sql_runner_query {
  derived_table: {
    sql: -- All policies expired since PP start date
           With Mort_Table as (
       SELECT
  "nonpay_cancellations"
  ,"uw_cancellations"
  ,"xpirations"
  ,"uw_nonrenewal"
  ,"Zip_Code" as county_code
  ,"County"
  ,"Created_Date"
  ,"Created_By"
  ,"End_Date"
  ,"Exec_Order_Name"
  ,"Protection_Period_Name"
  ,"Start_Date"
  ,"Updated_Date"

FROM dwh_temp.idalia_moratorium


          )
      SELECT bp.id as bright_policy_id
      , last_expiration.date, m.*
      FROM bright_policies bp
      JOIN products pr ON bp.product_id = pr.id
      JOIN properties p ON bp.property_id = p.id
      JOIN addresses a ON a.id = p.address_id
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
       LEFT JOIN Mort_Table m on cast(m.county_code as int) = cast(a.county_fips as int)
      LEFT JOIN LATERAL (
          SELECT pe.bright_policy_id
          , pe.date
          FROM policy_events pe
          WHERE 0=0
          AND pe.bright_policy_id = bp.id
          AND pe.type = 'PolicyEvent::Expiration'
          AND pe.status = 'success'
          ORDER BY pe.created_at DESC
          LIMIT 1
      ) last_expiration ON TRUE
      WHERE 0=0
      -- AND last_expiration.date < pp.started_at
      AND last_expiration.date BETWEEN cast(m.start_date as date) and cast(m.end_date as date)
      AND bp.status = 'expired'
      ORDER BY bp.id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bright_policy_id {
    type: string
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}."date" ;;
  }

  set: detail {
    fields: [
        bright_policy_id,
  date
    ]
  }
}
