view: protection_period_critical_notices {
  derived_table: {
    sql: select bp.bright_policy_id
              , cio.user_id
              , cio.recipient
              , cio.environment
              , cio.message_type
              , cio.message_status
              , cio."timestamp" as cio_message_timestamp
              , cio.campaign_name
              from dwh.customerio_message_transactions  as cio
              inner join ${protection_period_policies.SQL_TABLE_NAME} as bp
              on cio.user_id = bp.primary_applicant_user_id
              where 1=1
              and cio.campaign_name LIKE '%CRITICAL%'
              and cio.campaign_name not in
              ('CRITICAL - Customer Cancellation Confirmation'
              ,'CRITICAL - Notice of Non-Renewal (Insured-Requested)'
              ,'CRITICAL - Notice of Renewal - Mortgagee'
              ,'CRITICAL - Notice of Renewal - Insured'
              ,'CRITICAL - No Longer Pending Cancellation'
              ,'CRITICAL - Notice of Reinstatement'
              ,'CRITICAL - Missing Documents Effective Date'
              ,'CRITICAL - Roof Age Rejection Not Bound HO6'
              ,'CRITICAL - Kin Inspection Required'
              ,'CRITICAL - Converted HO3 to DP3 | Roof 15+ Years'
              ,'CRITICAL - Roof Age Rejection Not Bound HO3'
              ,'CRITICAL - Missing Documents - Final Reminder'
              ,'CRITICAL - Missing Documents Post Bind'
              ,'CRITICAL - Payment Receipt'
              ,'CRITICAL - Card Payment Reminder'
              ,'CRITICAL - Card Payment Reminder - Payment Still Outstanding'
              ,'CRITICAL - Failed Card Payment')
              and lower(cio.environment) like '%production%'
              and cio.message_status = 'delivered'
              and cio."timestamp" BETWEEN bp.protection_period_start_date and bp.protection_period_end_date
              and cio.message_type in ('email','sms') ;;
    persist_for: "6 hours"
    distribution_style:  all
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: recipient {
    type: string
    sql: ${TABLE}.recipient ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }

  dimension: message_status {
    type: string
    sql: ${TABLE}.message_status ;;
  }

  dimension: cio_message_timestamp {
    type: date_time
    sql: ${TABLE}.cio_message_timestamp ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  set: detail {
    fields: [
      bright_policy_id,
      user_id,
      recipient,
      environment,
      message_type,
      message_status,
      cio_message_timestamp,
      campaign_name
    ]
  }
}
