
view: nonrenewalexplore {
  derived_table: {
    sql: -- All policies expired since PP start date
      
      SELECT bp.id as bright_policy_id
      , last_non_renewed.non_renewal_date
      , last_non_renewed.non_renewal_reason
      FROM bright_policies bp
      JOIN products pr ON bp.product_id = pr.id
      JOIN properties p ON bp.property_id = p.id
      JOIN addresses a ON a.id = p.address_id
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
            AND pe.date BETWEEN '2023-03-01' AND '2023-05-01'
            and er.category != 'insured_request'
      ) as last_non_renewed
        on bp.id = last_non_renewed.bright_policy_id
      WHERE true=true
      -- AND last_non_renewed.non_renewal_date < pp.started_at
      AND bp.status = 'non_renewed'
      AND last_non_renewed.non_renewal_date between '2023-03-01' AND '2023-05-01'
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
