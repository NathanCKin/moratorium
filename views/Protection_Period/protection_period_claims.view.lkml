
view: protection_period_claims {
  derived_table: {
    sql: select  bp.bright_policy_id
            , listagg(claims.claim_number,', ') within group(order by claims.created_at desc) as claim_number
            , listagg(claims.status,', ') within group(order by claims.created_at desc) as claim_status
            , listagg(cast(date(claims.datetime_of_loss) as varchar),', ') within group(order by claims.created_at desc) as claim_loss_date
            , listagg(claims.loss_type,', ') within group(order by claims.created_at desc) as claim_loss_type
            , listagg(coalesce(tags.catastrophe_name,'Non-Cat'),', ') within group(order by claims.created_at desc) as claim_cat_name
            from ${protection_period_policies.SQL_TABLE_NAME} as bp
            inner join snapsheet.claims
            on claims.policy_number = bp.full_policy_number
            and date(claims.datetime_of_loss) >= date(bp.protection_period_start_date)
            and date(claims.datetime_of_loss) <= date(bp.protection_period_end_date)
            and claims.status != 'CANCELLED'
            left join (select claim_id, name as catastrophe_name from snapsheet.tags where name like '%PCS%' and active=true) as tags
            on tags.claim_id = claims.id
      group by 1 ;;
    persist_for: "6 hours"
    distribution_style:  all
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: claim_number {
    type: string
    sql: ${TABLE}.claim_number ;;
  }

  dimension: claim_status {
    type: string
    sql: ${TABLE}.claim_status ;;
  }

  dimension: claim_loss_date {
    type: string
    sql: ${TABLE}.claim_loss_date ;;
  }

  dimension: claim_loss_type {
    type: string
    sql: ${TABLE}.claim_loss_type ;;
  }

  dimension: claim_cat_name {
    type: string
    sql: ${TABLE}.claim_cat_name ;;
  }

  set: detail {
    fields: [
        bright_policy_id,
  claim_number,
  claim_status,
  claim_loss_date,
  claim_loss_type,
  claim_cat_name
    ]
  }
}
