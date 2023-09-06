
view: cancel_email {
  derived_table: {
    sql: -- All policies expired since PP start date
      
      SELECT bp.id as bright_policy_id
      ,users.email as primary_applicant_email
      ,last_cancel.date
      ,m.*
      FROM dotcom.bright_policies bp
      JOIN dotcom.products pr ON bp.product_id = pr.id
      JOIN dotcom.properties p ON bp.property_id = p.id
      JOIN dotcom.addresses a ON a.id = p.address_id
      LEFT JOIN dwh_temp.idalia_moratorium  m on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
      
      --zip code 
      left join dotcom.policy_contacts pc on pc.policy_id = bp.id
      left join dotcom.people people on people.id = pc.contact_id
      left join dotcom.users users on people.user_id = users.id
      
      
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      LEFT JOIN  (
          SELECT pe.bright_policy_id
          , pe.date
          FROM dotcom.policy_events pe
          left join dotcom.bright_policies bp on pe.bright_policy_id = bp.id
          WHERE 0=0
          AND pe.type = 'PolicyEvent::Cancellation'
          AND pe.status = 'success'
          ORDER BY pe.created_at DESC
          LIMIT 1
      ) last_cancel ON last_cancel.bright_policy_id = bp.id
      WHERE 0=0
       --AND last_expiration.date < pp.started_at
      AND last_cancel.date BETWEEN cast(m.start_date as date) and cast(m.end_date as date)
      --LEFT JOIN dwh_temp.idalia_moratorium m on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
      AND bp.status = 'cancelled'
      
      and pc.contact_type = 'Person'
      and pc.type = 'PolicyContacts::Applicant'
      and pc.deleted_at is null 
      and pc.policy_type = 'BrightPolicy' 
      and pc.data <> 'co_applicant'
      and people.deleted_at is null
      
      ORDER BY bp.id DESC ;
      
      -- select distinct type
      -- from public.policy_events ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: primary_applicant_email {
    type: string
    sql: ${TABLE}.primary_applicant_email ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: nonpay_cancellations {
    type: number
    sql: ${TABLE}.nonpay_cancellations ;;
  }

  dimension: uw_cancellations {
    type: number
    sql: ${TABLE}.uw_cancellations ;;
  }

  dimension: xpirations {
    type: number
    sql: ${TABLE}.xpirations ;;
  }

  dimension: uw_nonrenewal {
    type: number
    sql: ${TABLE}.uw_nonrenewal ;;
  }

  dimension: zip_code {
    type: number
    sql: ${TABLE}.zip_code ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: created_date {
    type: date
    sql: ${TABLE}.created_date ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: end_date {
    type: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: exec_order_name {
    type: string
    sql: ${TABLE}.exec_order_name ;;
  }

  dimension: protection_period_name {
    type: string
    sql: ${TABLE}.protection_period_name ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: updated_date {
    type: date
    sql: ${TABLE}.updated_date ;;
  }

  set: detail {
    fields: [
        bright_policy_id,
	primary_applicant_email,
	date,
	nonpay_cancellations,
	uw_cancellations,
	xpirations,
	uw_nonrenewal,
	zip_code,
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
