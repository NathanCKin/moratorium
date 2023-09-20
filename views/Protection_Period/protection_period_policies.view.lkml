
view: protection_period_policies {
  derived_table: {
    sql:
      select  bp.id       as bright_policy_id
            , bp.status   as policy_status
            , bp.property_id
            , bp.full_policy_number
            , bp.term             as current_policy_term
            , bp.payment_type     as policy_payment_type
            , bp.payment_schedule as policy_payment_schedule
            , a.id as address_id
            , a.county_fips
            , a.county
            , date(c.effective_date) as policy_inception_date
            , pr.state                  as product_state
            , pr.line                   as product_line
            , date(pr.effective_date)   as product_effective_date
            , case when m.start_date is not null then 'true' else 'false' end as fips_in_protection_period
            , date(m.start_date) as protection_period_start_date
            , date(m.end_date) as protection_period_end_date
            , date('2023-09-01') as protection_period_policy_inception_cutoff
            --, date(m.policy_inception_date_cutoff) as protection_period_policy_inception_cutoff
            , m.protection_period_name
            , people.first_name||' '||people.last_name  as primary_applicant_full_name
            , users.email                               as primary_applicant_email
            , users.id                                  as primary_applicant_user_id
            , people.id                                 as primary_applicant_person_id
            from       dotcom.bright_policies     as bp
            inner join dotcom.products            as pr on bp.product_id = pr.id
            inner join dotcom.properties          as p  on bp.property_id = p.id
            inner join dotcom.addresses           as a  on a.id = p.address_id
            inner join dotcom.coverages           as c  on c.id = bp.coverage_id
            inner join dwh_temp.idalia_moratorium as m  on cast(m.zip_code as varchar(max)) = cast(a.county_fips as varchar(max))
            left  join dotcom.policy_contacts     as pc on pc.policy_id = bp.id
            left  join dotcom.people                    on people.id = pc.contact_id
            left  join dotcom.users                     on people.user_id = users.id
            where 1=1
            and bp.status != 'quote'
            --and date(c.effective_date) <= '2023-08-31'
            and pc.contact_type = 'Person'
            and pc.type = 'PolicyContacts::Applicant'
            and pc.deleted_at is null
            and pc.policy_type = 'BrightPolicy'
            and json_extract_path_text(pc.data,'co_applicant',true) = 'false'
            and people.deleted_at is null
            ;;
    persist_for: "6 hours"
    distribution_style:  all
  }

  dimension: bright_policy_id {
    type: number
    sql: ${TABLE}.bright_policy_id ;;
    value_format: "0"
    primary_key: yes
    link: {
      label: "Kinfo"
      url:"https://app.kin.com/kintranet/policy_details/{{value}}"
      icon_url: "https://www.kin.com/build/images/logos/kin-primary.svg"
    }
  }

  dimension: policy_status {
    type: string
    sql: ${TABLE}.policy_status ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}.property_id ;;
    value_format: "0"
    link: {
      label: "Kinfo"
      url:"https://app.kin.com/kintranet/properties/{{value}}"
      icon_url: "https://www.kin.com/build/images/logos/kin-primary.svg"
    }
  }

  dimension: full_policy_number {
    type: string
    sql: ${TABLE}.full_policy_number ;;
  }

  dimension: current_policy_term {
    type: number
    sql: ${TABLE}.current_policy_term ;;
  }

  dimension: policy_payment_type {
    type: string
    sql: ${TABLE}.policy_payment_type ;;
  }

  dimension: policy_payment_schedule {
    type: string
    sql: ${TABLE}.policy_payment_schedule ;;
  }

  dimension: address_id {
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: county_fips {
    type: string
    sql: ${TABLE}.county_fips ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: policy_inception_date {
    type: date
    sql: ${TABLE}.policy_inception_date ;;
  }

  dimension: product_state {
    type: string
    sql: ${TABLE}.product_state ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.product_line ;;
  }

  dimension: product_effective_date {
    type: date
    sql: ${TABLE}.product_effective_date ;;
  }

  dimension: fips_in_protection_period {
    type: string
    sql: ${TABLE}.fips_in_protection_period ;;
  }

  dimension: protection_period_start_date {
    type: date
    sql: ${TABLE}.protection_period_start_date ;;
  }

  dimension: protection_period_end_date {
    type: date
    sql: ${TABLE}.protection_period_end_date ;;
  }

  dimension: protection_period_policy_inception_cutoff {
    type: date
    sql: ${TABLE}.protection_period_policy_inception_cutoff ;;
  }

  dimension: protection_period_name {
    type: string
    sql: ${TABLE}.protection_period_name ;;
  }

  dimension: primary_applicant_full_name {
    type: string
    sql: ${TABLE}.primary_applicant_full_name ;;
  }

  dimension: primary_applicant_email {
    type: string
    sql: ${TABLE}.primary_applicant_email ;;
  }

  dimension: primary_applicant_user_id {
    type: number
    sql: ${TABLE}.primary_applicant_user_id ;;
  }

  dimension: primary_applicant_person_id {
    type: number
    sql: ${TABLE}.primary_applicant_person_id ;;
  }

  dimension: policy_inception_before_cutoff {
    type: yesno
    sql: case when datediff(days,${policy_inception_date},${protection_period_policy_inception_cutoff}) > 0 then true else false end ;;
  }

  set: detail {
    fields: [
  bright_policy_id,
  policy_status,
  property_id,
  full_policy_number,
  current_policy_term,
  policy_payment_type,
  policy_payment_schedule,
  address_id,
  county_fips,
  county,
  policy_inception_date,
  product_state,
  product_line,
  product_effective_date,
  fips_in_protection_period,
  protection_period_start_date,
  protection_period_end_date,
  protection_period_policy_inception_cutoff,
  protection_period_name,
  primary_applicant_full_name,
  primary_applicant_email,
  primary_applicant_user_id,
  primary_applicant_person_id
    ]
  }
}
