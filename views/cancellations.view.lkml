
view: cancellations {
  derived_table: {
    sql: -- All policies expired since PP start date

      SELECT bp.id as bright_policy_id
      , last_cancel.date, m.*
      FROM dotcom.bright_policies bp
      JOIN dotcom.products pr ON bp.product_id = pr.id
      JOIN dotcom.properties p ON bp.property_id = p.id
      JOIN dotcom.addresses a ON a.id = p.address_id
       LEFT JOIN dwh_temp.idalia_moratorium  m on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      LEFT JOIN  LATERAL(
          SELECT pe.bright_policy_id
          , pe.date
          FROM dotcom.policy_events pe
          WHERE 0=0
          AND pe.bright_policy_id = bp.id
          AND pe.type = 'PolicyEvent::Cancellation'
          AND pe.status = 'success'
          ORDER BY pe.created_at DESC
          LIMIT 1
      ) last_cancel ON TRUE
      WHERE 0=0
      -- AND last_expiration.date < pp.started_at
      AND last_cancel.date BETWEEN  cast(m.start_date as date) and cast(m.end_date as date)
      AND bp.status = 'cancelled'
      ORDER BY bp.id DESC ;

      -- select distinct type
      -- from public.policy_events ;;
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
