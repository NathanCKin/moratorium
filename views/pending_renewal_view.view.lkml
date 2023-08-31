
view: pending_renewal_view {
  derived_table: {
    sql: -- All policies expired since PP start date


      SELECT bp.id as bright_policy_id
      , bp.status
      , last_non_renewed.non_renewal_date
      , last_non_renewed.non_renewal_reason
      ,m.*
      FROM dotcom.bright_policies bp
      JOIN dotcom.products pr ON bp.product_id = pr.id
      JOIN dotcom.properties p ON bp.property_id = p.id
      JOIN dotcom.addresses a ON a.id = p.address_id
        LEFT JOIN dwh_temp.idalia_moratorium  m on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
            --LEFT JOIN Mort_Table m on cast(m.county_code as int) = cast(a.county_fips as int)

      LEFT JOIN (
          SELECT distinct
            pe.bright_policy_id
          , max(pe.date) over(partition by pe.bright_policy_id) as non_renewal_date
          , first_value(er.category) over(partition by pe.bright_policy_id order by pe.date desc, pe.created_at desc rows between unbounded preceding and unbounded following) as non_renewal_reason
          FROM dotcom.policy_events as pe
          LEFT JOIN dotcom.policy_event_reasons as per
            on true=true
            and pe.id = per.policy_event_id
          LEFT JOIN dotcom.event_reasons as er
            on true=true
            and per.event_reason_id = er.id
          WHERE true=true
            AND pe.type = 'PolicyEvent::NonRenewal'
            AND pe.status in('success', 'pending')
            --AND pe.date between '2023-07-01' AND '2023-07-30'
            and er.category != 'insured_request'
      ) as last_non_renewed
        on bp.id = last_non_renewed.bright_policy_id
      WHERE true=true
      -- AND last_non_renewed.non_renewal_date < pp.started_at
      AND bp.status = 'in_force'
      AND last_non_renewed.non_renewal_date BETWEEN  cast(m.start_date as date) and cast(m.end_date as date)
      AND current_date <= last_non_renewed.non_renewal_date
      ORDER BY bp.id DESC
      LIMIT 20 ;;
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

  dimension: non_renewal_date {
    type: date
    sql: ${TABLE}."non_renewal_date" ;;
  }

  dimension: non_renewal_reason {
    type: string
    sql: ${TABLE}."non_renewal_reason" ;;
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
  non_renewal_date,
  non_renewal_reason
    ]
  }
}
