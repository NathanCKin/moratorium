
view: expiration {
  derived_table: {
    sql: -- All policies expired since PP start date

      With Mort_Table as (select
    1 as nonpay_cancellations,
    1 as uw_cancellations,
    1 as expirations,
    1 as uw_nonrenewal,
    cast(12127 as int) as county_code,
    'Ionia' as County,
    '2023-07-19' as Created_Date,
    'ken.hebel@kin.com' as Created_By,
    '2023-08-05' as End_Date,
    'Ian Order' as Exec_Order_Name,
    'Ian Period' as Protection_Period_Name,
    '2023-07-25' as Start_Date,
    '2023-07-19'as Updated_Date


    union
    select
    1 as nonpay_cancellations,
    1 as uw_cancellations,
    1 as expirations,
    1 as uw_nonrenewal,
    cast(12091 as Int) as  Zip_Code,
    'Ionia' as County ,
    '2023-07-19' as Created_Date,
    'ken.hebel@kin.com' as Created_By,
    '2023-08-05' as End_Date,
    'Ian Order' as Exec_Order_Name,
    'Ian Period'as Protection_Period_Name,
    '2023-07-25' as Start_Date,
    '2023-07-19' as Updated_Date

    union

    select
    1 as nonpay_cancellations,
    1 as uw_cancellations,
    1 as expirations,
    1 as uw_nonrenewal,
    cast(64231 as int) as Zip_Code,
    'Ionia' as County ,
    '2023-07-19' as Created_Date,
    'ken.hebel@kin.com' as Created_By,
    '2023-08-05'as End_Date,
    'Ian Order' as Exec_Order_Name,
    'Ian Period'as Protection_Period_Name,
    '2023-07-25'as Start_Date,
    '2023-07-19' as Updated_Date)


         SELECT bp.id as bright_policy_id
      , last_expiration.date

      , m.county_code
      ,m.protection_period_name
      FROM bright_policies bp
      JOIN products pr ON bp.product_id = pr.id
      JOIN properties p ON bp.property_id = p.id
      JOIN addresses a ON a.id = p.address_id
      left JOIN Mort_Table m on cast(m.county_code as int) = cast(a.county_fips as int)
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
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
      AND last_expiration.date BETWEEN  cast(m.start_date as date) and cast(m.end_date as date)
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

  dimension: county_code {
    type: string
    sql: ${TABLE}."county_code" ;;
  }
  dimension: protection_period_name {
    type: string
    sql: ${TABLE}."protection_period_name" ;;
  }


  set: detail {
    fields: [
        bright_policy_id,
  date
    ]
  }
}
