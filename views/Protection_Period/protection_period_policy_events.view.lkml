
view: protection_period_policy_events {
  derived_table: {
    sql: with policy_events as
            (select pe.bright_policy_id
            , pe.id as policy_event_id
            , pe.status as policy_event_status
            , per.event_reason_code
            , pe."type" as policy_event_type
            , pe."date" as policy_event_effective_date
            , pe.transaction_date as policy_event_transaction_date
            , case when pe."type" = 'PolicyEvent::NonRenewal' then date(dateadd(days,-125,pe."date")) else null end as non_renewal_notice_date
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
            where 1=1
            and pe."type" in ('PolicyEvent::NonRenewal','PolicyEvent::Cancellation','PolicyEvent::Expiration')
            and pe.status in ('success','pending')
            and pe.deleted_at is null)


      select bp.bright_policy_id
            , policy_events.policy_event_id
            , policy_events.policy_event_effective_date
            , policy_events.policy_event_transaction_date
            , policy_events.non_renewal_notice_date
            , policy_events.policy_event_status
            , policy_events.event_reason_code
            , policy_events.policy_event_type
            from ${protection_period_policies.SQL_TABLE_NAME}  as bp
            left  join policy_events on policy_events.bright_policy_id = bp.bright_policy_id --and last_cancel.row_num=1
            where 1=1
            and policy_events.event_reason_code not like '%insured_request%'
            and ((policy_events.policy_event_type in ('PolicyEvent::Cancellation','PolicyEvent::Expiration')
                  and policy_events.policy_event_transaction_date BETWEEN bp.protection_period_start_date and bp.protection_period_end_date)
                or
                (policy_events.policy_event_type='PolicyEvent::NonRenewal'
                  and (policy_events.policy_event_effective_date BETWEEN bp.protection_period_start_date and bp.protection_period_end_date
                       or
                       policy_events.non_renewal_notice_date BETWEEN bp.protection_period_start_date and bp.protection_period_end_date)))
            ;;
    persist_for: "6 hours"
    distribution_style:  all
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: policy_event_id {
    type: number
    sql: ${TABLE}.policy_event_id ;;
  }

  dimension: policy_event_effective_date {
    type: date
    sql: ${TABLE}.policy_event_effective_date ;;
  }

  dimension: policy_event_transaction_date {
    type: date
    sql: ${TABLE}.policy_event_transaction_date ;;
  }

  dimension: non_renewal_notice_date {
    type: date
    sql: ${TABLE}.non_renewal_notice_date ;;
  }

  dimension: policy_event_status {
    type: string
    sql: ${TABLE}.policy_event_status ;;
  }

  dimension: event_reason_code {
    type: string
    sql: ${TABLE}.event_reason_code ;;
  }

  dimension: policy_event_type {
    type: string
    sql: ${TABLE}.policy_event_type ;;
  }

  set: detail {
    fields: [
        bright_policy_id,
  policy_event_id,
  policy_event_effective_date,
  policy_event_transaction_date,
  non_renewal_notice_date,
  policy_event_status,
  event_reason_code,
  policy_event_type
    ]
  }
}
