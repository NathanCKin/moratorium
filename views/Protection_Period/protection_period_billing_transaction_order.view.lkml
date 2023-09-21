
view: protection_period_billing_transaction_order {
  derived_table: {
    sql:
      with billing_installs as
            (select bst.bright_policy_id
            , bst.term
            , max(bst.installment_number) as max_installment_number
            from dotcom.billing_scheduled_transactions as bst
            inner join ${protection_period_policies.SQL_TABLE_NAME} as bp
            on bp.bright_policy_id = bst.bright_policy_id
            where 1=1
            and bst.payment_type = 'scheduled'
            and bst.status != 'cancelled'
            and bst.installment_number is not null
            and bst.deleted_at is null
            group by 1,2)

      , billing_all as
            (select bst.bright_policy_id
            , bst.term
            , bst.installment_number
            , billing_installs.max_installment_number
            , date(dateadd(year,bst.term    ,bp.policy_inception_date)) as term_effective_date
            , date(dateadd(year,(bst.term+1),bp.policy_inception_date)) as term_end_date
            , max(bst.due_date) as due_date
            , cast(sum(bst.amount_cents)/100 as decimal(15,4)) as amount_dollars
            from dotcom.billing_scheduled_transactions as bst
            inner join ${protection_period_policies.SQL_TABLE_NAME} as bp
                    on bp.bright_policy_id = bst.bright_policy_id
            left  join billing_installs
                    on  bst.bright_policy_id = billing_installs.bright_policy_id
                    and bst.term = billing_installs.term
            where 1=1
            and bst.payment_type = 'scheduled'
            and bst.status != 'cancelled'
            and bst.installment_number is not null
            and bst.deleted_at is null
            group by 1,2,3,4,5,6
            )

      select  bst.bright_policy_id
            , bst.term
            , bst.amount_dollars
            , bst.due_date
            , bst.installment_number
            , bst.term_effective_date
            , bst.term_end_date
            , case when bst.installment_number = 1 then (bst.due_date-bst_prev_term.due_date)
                   else (bst.due_date-bst_prev_inst.due_date)
                   end as days_since_prior_installment
            , row_number() over(partition by bst.bright_policy_id, bst.term order by bst.due_date, bst.installment_number desc) as row_num_due_date
            , coalesce(bst_prev_inst.term,bst_prev_term.term) as prior_install_payment_term
            , coalesce(bst_prev_inst.installment_number,bst_prev_term.installment_number) as prior_install_number
            , coalesce(bst_prev_inst.due_date,bst_prev_term.due_date) as prior_install_due_date
            from billing_all as bst
            left join billing_all as bst_prev_inst on bst.bright_policy_id = bst_prev_inst.bright_policy_id
                                                  and bst.term = bst_prev_inst.term
                                                  and bst.installment_number > 1
                                                  and bst.installment_number = (bst_prev_inst.installment_number+1)
            left join billing_all as bst_prev_term on bst.bright_policy_id = bst_prev_term.bright_policy_id
                                                  and bst.term = (bst_prev_term.term+1)
                                                  and bst.installment_number = 1
                                                  and bst_prev_term.installment_number = bst_prev_term.max_installment_number
      ;;
    persist_for: "12 hours"
    distribution_style:  all
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}.term ;;
  }

  dimension: amount_dollars {
    type: number
    sql: ${TABLE}.amount_dollars ;;
  }

  dimension: due_date {
    type: date
    sql: ${TABLE}.due_date ;;
  }

  dimension: installment_number {
    type: number
    sql: ${TABLE}.installment_number ;;
  }

  dimension: term_effective_date {
    type: date
    sql: ${TABLE}.term_effective_date ;;
  }

  dimension: term_end_date {
    type: date
    sql: ${TABLE}.term_end_date ;;
  }

  dimension: days_since_prior_installment {
    type: number
    sql: ${TABLE}.days_since_prior_installment ;;
  }

  dimension: row_num_due_date {
    type: number
    sql: ${TABLE}.row_num_due_date ;;
  }

  dimension: prior_install_payment_term {
    type: number
    sql: ${TABLE}.prior_install_payment_term ;;
  }

  dimension: prior_install_number {
    type: number
    sql: ${TABLE}.prior_install_number ;;
  }

  dimension: prior_install_due_date {
    type: date
    sql: ${TABLE}.prior_install_due_date ;;
  }

  dimension: billing_issue_reason {
    type: string
    sql: case when ${due_date} > ${term_end_date} then 'prior term payment scheduled after renewal'
              when (${installment_number} = 1 and ${row_num_due_date} > 1) then 'installment 1 after installment 2'
              when abs(${days_since_prior_installment}) <= 10 then 'payments in close proximity'
              else 'none' end ;;
  }

  set: detail {
    fields: [
  bright_policy_id,
  term,
  amount_dollars,
  due_date,
  installment_number,
  term_effective_date,
  term_end_date,
  days_since_prior_installment,
  row_num_due_date,
  prior_install_payment_term,
  prior_install_number,
  prior_install_due_date,
  billing_issue_reason
    ]
  }
}
