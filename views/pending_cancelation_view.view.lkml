
view: pending_cancelation_view {
  derived_table: {
    sql: -- All policies expired since PP start date
      With Mort_Table as (select
       SELECT
  "nonpay_cancellations"
  ,"uw_cancellations"
  ,"xpirations"
  ,"uw_nonrenewal"
  ,"Zip_Code"
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
      , bp.status
      , cancelled.cancelled_date
      , cancelled.cancelled_reason
      ,m.*
      FROM bright_policies bp
            JOIN properties p ON bp.property_id = p.id
            JOIN addresses a ON a.id = p.address_id

            -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      LEFT JOIN Mort_Table m on cast(m.county_code as int) = cast(a.county_fips as int)
      JOIN products pr ON bp.product_id = pr.id

      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      LEFT JOIN (
          SELECT distinct
            pe.bright_policy_id
          , max(pe.date) over(partition by pe.bright_policy_id) as cancelled_date
          , first_value(er.category) over(partition by pe.bright_policy_id order by pe.date desc, pe.created_at desc rows between unbounded preceding and unbounded following) as cancelled_reason
          FROM policy_events as pe
          LEFT JOIN policy_event_reasons as per
            on true=true
            and pe.id = per.policy_event_id
          LEFT JOIN event_reasons as er
            on true=true
            and per.event_reason_id = er.id
          WHERE true=true
            AND pe.type = 'PolicyEvent::Cancellation'
            AND pe.status in('success', 'pending')
            --AND pe.date between '2023-07-01' AND '2023-07-30'
            and er.category != 'insured_request'
      ) as cancelled
        on bp.id = cancelled.bright_policy_id
      WHERE true=true
      -- AND cancelled.non_renewal_date < pp.started_at
      AND bp.status = 'in_force'
      AND cancelled.cancelled_date BETWEEN  cast(m.start_date as date) and cast(m.end_date as date)
      AND current_date <= cancelled.cancelled_date
      ORDER BY bp.id DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bright_policy_id {
    type: string
    sql: ${TABLE}."bright_policy_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: cancelled_date {
    type: date
    sql: ${TABLE}."cancelled_date" ;;
  }

  dimension: cancelled_reason {
    type: string
    sql: ${TABLE}."cancelled_reason" ;;
  }

  dimension: nonpay_cancellations {
    type: number
    sql: ${TABLE}."nonpay_cancellations" ;;
  }

  dimension: uw_cancellations {
    type: number
    sql: ${TABLE}."uw_cancellations" ;;
  }

  dimension: expirations {
    type: number
    sql: ${TABLE}."expirations" ;;
  }

  dimension: uw_nonrenewal {
    type: number
    sql: ${TABLE}."uw_nonrenewal" ;;
  }

  dimension: county_code {
    type: number
    sql: ${TABLE}."county_code" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }

  dimension: created_date {
    type: string
    sql: ${TABLE}."created_date" ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}."created_by" ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}."end_date" ;;
  }

  dimension: exec_order_name {
    type: string
    sql: ${TABLE}."exec_order_name" ;;
  }

  dimension: protection_period_name {
    type: string
    sql: ${TABLE}."protection_period_name" ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}."start_date" ;;
  }

  dimension: updated_date {
    type: string
    sql: ${TABLE}."updated_date" ;;
  }

  set: detail {
    fields: [
        bright_policy_id,
  status,
  cancelled_date,
  cancelled_reason,
  nonpay_cancellations,
  uw_cancellations,
  expirations,
  uw_nonrenewal,
  county_code,
  county,
  created_date,
  created_by,
  end_date,
  exec_order_name,
  protection_period_name,
  start_date,
  updated_date
    ]
  }
}
