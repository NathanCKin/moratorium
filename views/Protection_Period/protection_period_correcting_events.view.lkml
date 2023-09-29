
view: protection_period_correcting_events {
  derived_table: {
    sql: with policy_events_all as
            (select policy_events.bright_policy_id
            , policy_events."type" as policy_event_type
            , policy_events.status as policy_event_status
            , date(policy_events."date") as policy_event_effective_date
            , date(policy_events.transaction_date) as policy_event_transaction_date
            , policy_events.created_at as policy_event_created_at
            , row_number() over(partition by policy_events.bright_policy_id, policy_events."type" order by policy_events."date" desc) as row_num
            from dotcom.policy_events
            inner join ${protection_period_policies.SQL_TABLE_NAME} as bp
            on policy_events.bright_policy_id = bp.bright_policy_id
            where 1=1
            and policy_events.deleted_at is null
            and policy_events.status in ('success','pending','cancelled')
            and policy_events."type" in ('PolicyEvent::Extension'
                          ,'PolicyEvent::ExpirationProtectionApplied'
                          ,'PolicyEvent::ExpiredCorrected'
                          ,'PolicyEvent::NonPayCancellationProtectionApplied'
                          ,'PolicyEvent::NonRenewedCorrected'
                          ,'PolicyEvent::PendingNonRenewalCorrected')

            )
-- Testing
      , policy_activity as
            (select policy_activities.bright_policy_id
            , policy_activities.whodunnit as policy_event_type
            , 'policy_activity' as policy_event_status
            , date(policy_activities.created_at) as policy_event_effective_date
            , date(policy_activities.created_at) as policy_event_transaction_date
            , policy_activities.created_at as policy_event_created_at
            , row_number() over(partition by policy_activities.bright_policy_id, policy_activities.whodunnit order by policy_activities.created_at desc) as row_num
            from dotcom.policy_activities
            inner join ${protection_period_policies.SQL_TABLE_NAME} as bp
            on policy_activities.bright_policy_id = bp.bright_policy_id
            --where policy_activities.name = 'Protection Period Non Renewal Protection'
            where policy_activities.whodunnit in
                  ('PolicyJobs::NonRenewalNoticeProtection'
                  ,'FixUwCancellations'
                  ,'FixNonPayCancellations'
                  ,'ReinstateNonPayCancellationsPartTwo')
            )

      select bright_policy_id
            , policy_event_type
            , policy_event_status
            , policy_event_effective_date
            , policy_event_transaction_date
            , policy_event_created_at
      from policy_events_all
      where row_num = 1
      union
      select bright_policy_id
            , policy_event_type
            , policy_event_status
            , policy_event_effective_date
            , policy_event_transaction_date
            , policy_event_created_at
      from policy_activity
      where row_num = 1 ;;
    persist_for: "6 hours"
    distribution_style:  all
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: policy_event_type {
    type: string
    sql: ${TABLE}.policy_event_type ;;
  }

  dimension: policy_event_status {
    type: string
    sql: ${TABLE}.policy_event_status ;;
  }

  dimension: policy_event_effective_date {
    type: date
    convert_tz: no
    sql: ${TABLE}.policy_event_effective_date ;;
  }

  dimension: policy_event_transaction_date {
    type: date
    convert_tz: no
    sql: ${TABLE}.policy_event_transaction_date ;;
  }

  dimension: policy_event_created_at {
    type: date_time
    sql: ${TABLE}.policy_event_created_at ;;
  }

  dimension: policy_event_claims_relevant {
    type: yesno
    sql: case when ${policy_event_type} in ('PolicyEvent::ExpirationProtectionApplied','PolicyEvent::ExpiredCorrected','PolicyEvent::Extension','PolicyEvent::NonPayCancellationProtectionApplied','FixNonPayCancellations','ReinstateNonPayCancellationsPartTwo')
              then true else false end;;
  }

  measure: count_of_pp_correcting_events {
    description: "Distinct count of protection period correcting policy events."
    type: count_distinct
    sql: ${bright_policy_id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
        bright_policy_id,
  policy_event_type,
  policy_event_status,
  policy_event_effective_date,
  policy_event_transaction_date,
  policy_event_created_at
    ]
  }
}
