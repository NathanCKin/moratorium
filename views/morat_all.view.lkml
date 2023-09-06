
view: morat_all {
  derived_table: {
    sql: select bp.id as bright_policy_id
      ,bp.status   as policy_status
      ,users.email as primary_applicant_email
      ,last_cancel.policy_event_id
      ,last_cancel.policy_event_date
      ,last_cancel.policy_event_status
      ,last_cancel.event_reason_code
      ,m.*
      from       dotcom.bright_policies as bp
      inner join dotcom.products as pr ON bp.product_id = pr.id
      inner join dotcom.properties as p ON bp.property_id = p.id
      inner join dotcom.addresses as a ON a.id = p.address_id
      left  join dwh_temp.idalia_moratorium as m on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
      left  join dotcom.policy_contacts as pc on pc.policy_id = bp.id
      left  join dotcom.people on people.id = pc.contact_id
      left  join dotcom.users on people.user_id = users.id
      left  join (select pe.bright_policy_id
                  , pe."date" as policy_event_date
                  , pe.id as policy_event_id
                  , pe.status as policy_event_status
                  , per.event_reason_code
                  , row_number() over(partition by pe.bright_policy_id order by pe.created_at desc) as row_num
                  from dotcom.policy_events pe
                  left join (select per.policy_event_id
                            , listagg(er.category||' : '||er.reason_code,', ') within group(order by per.created_at desc) as event_reason_code
                            from dotcom.policy_event_reasons as per
                            left join dotcom.event_reasons as er
                            on er.id = per.event_reason_id
                            and er.is_active='true'
                            group by 1) as per
                            on per.policy_event_id = pe.id
                  where 0=0
                  and pe.type = 'PolicyEvent::Cancellation'
                  and pe.status in ('success','pending')
                  and pe.deleted_at is null
                  ) last_cancel on last_cancel.bright_policy_id = bp.id
                             --and last_cancel.row_num=1

      where 1=1
      and last_cancel.policy_event_date BETWEEN cast(m.start_date as date) and cast(m.end_date as date)
      --and bp.status = 'cancelled'
      and bp.status != 'quote'
      and pc.contact_type = 'Person'
      and pc.type = 'PolicyContacts::Applicant'
      and pc.deleted_at is null
      and pc.policy_type = 'BrightPolicy'
      and json_extract_path_text(pc.data,'co_applicant',true) = 'false'
      and people.deleted_at is null
      and last_cancel.event_reason_code not like '%insured_request%'

      order by bp.id, last_cancel.policy_event_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: policy_status {
    type: string
    sql: ${TABLE}.policy_status ;;
  }

  dimension: primary_applicant_email {
    type: string
    sql: ${TABLE}.primary_applicant_email ;;
  }

  dimension: policy_event_id {
    type: number
    sql: ${TABLE}.policy_event_id ;;
  }

  dimension: policy_event_date {
    type: date
    sql: ${TABLE}.policy_event_date ;;
  }

  dimension: policy_event_status {
    type: string
    sql: ${TABLE}.policy_event_status ;;
  }

  dimension: event_reason_code {
    type: string
    sql: ${TABLE}.event_reason_code ;;
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
  policy_status,
  primary_applicant_email,
  policy_event_id,
  policy_event_date,
  policy_event_status,
  event_reason_code,
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
