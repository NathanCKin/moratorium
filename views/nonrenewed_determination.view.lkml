
view: nonrenewed_determination {
  derived_table: {
    sql: -- All policies expired since PP start date

      SELECT bp.id as bright_policy_id
      , last_non_renewed.date, m.*
      FROM bright_policies bp
      JOIN products pr ON bp.product_id = pr.id
      JOIN properties p ON bp.property_id = p.id
      JOIN addresses a ON a.id = p.address_id
        LEFT JOIN dwh_temp.idalia_moratorium  m on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      LEFT JOIN LATERAL (
          SELECT pe.bright_policy_id
          , pe.date
          FROM policy_events pe
          WHERE 0=0
          AND pe.bright_policy_id = bp.id
          AND pe.type = 'PolicyEvent::NonRenewal'
          AND pe.status = 'success'
          ORDER BY pe.created_at DESC
          LIMIT 1
      ) last_non_renewed ON TRUE
      WHERE 0=0
      -- AND last_expiration.date < pp.started_at
      AND last_non_renewed.date BETWEEN '2023-03-01' AND '2023-05-01'
      AND bp.status = 'non_renewed'
      ORDER BY bp.id DESC LIMIT 10;

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
