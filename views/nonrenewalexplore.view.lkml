
view: nonrenewalexplore {
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
      , last_non_renewed.non_renewal_date
      , last_non_renewed.non_renewal_reason
      , a.county_fips
      , m.county_code
      ,m.protection_period_name
      FROM bright_policies bp
      JOIN products pr ON bp.product_id = pr.id
      JOIN properties p ON bp.property_id = p.id
      JOIN addresses a ON a.id = p.address_id
      left JOIN Mort_Table m on cast(m.county_code as int) = cast(a.county_fips as int)
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      LEFT JOIN (
          SELECT distinct
            pe.bright_policy_id
          , max(pe.date) over(partition by pe.bright_policy_id) as non_renewal_date
          , first_value(er.category) over(partition by pe.bright_policy_id order by pe.date desc, pe.created_at desc rows between unbounded preceding and unbounded following) as non_renewal_reason
          FROM policy_events as pe
          LEFT JOIN policy_event_reasons as per
            on true=true
            and pe.id = per.policy_event_id
          LEFT JOIN event_reasons as er
            on true=true
            and per.event_reason_id = er.id
          WHERE true=true
            AND pe.type = 'PolicyEvent::NonRenewal'
            AND pe.status = 'success'
            --AND pe.date BETWEEN '2023-03-01' AND '2023-05-01'
            and er.category != 'insured_request'
      ) as last_non_renewed
        on bp.id = last_non_renewed.bright_policy_id
      WHERE true=true
      -- AND last_non_renewed.non_renewal_date < pp.started_at
      AND bp.status = 'non_renewed'
      AND last_non_renewed.non_renewal_date between cast (m.start_date as date) and cast (m.end_date as date)
      ORDER BY bp.id DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bright_policy_id {
    type: string
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: non_renewal_date {
    type: date
    sql: ${TABLE}."non_renewal_date" ;;
  }

  dimension: non_renewal_reason {
    type: string
    sql: ${TABLE}."non_renewal_reason" ;;
  }

  set: detail {
    fields: [
        bright_policy_id,
  non_renewal_date,
  non_renewal_reason
    ]
  }
}
