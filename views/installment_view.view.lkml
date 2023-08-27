
view: installment_view {
  derived_table: {
    sql: -- All policies expired since PP start date
      With Mort_Table as (select
          1 as nonpay_cancellations,
          1 as uw_cancellations,
          1 as expirations,
          1 as uw_nonrenewal,
        
          cast(12127 as int) as county_code,
          'Ionia' as County,
          '2023-07-19' as Created_Date,
          'ken.hebel@kin.com' as Created_By,
          '2023-08-05' as End_Date,
          'Ian Order' as Exec_Order_Name,
          'Ian Period' as Protection_Period_Name,
          '2023-07-25' as Start_Date,
          '2023-07-19'as Updated_Date
      
      
          union
          select
          1 as nonpay_cancellations,
          1 as uw_cancellations,
          1 as expirations,
          1 as uw_nonrenewal,
          cast(12091 as Int) as  Zip_Code,
          'Ionia' as County ,
          '2023-07-19' as Created_Date,
          'ken.hebel@kin.com' as Created_By,
          '2023-08-05' as End_Date,
          'Ian Order' as Exec_Order_Name,
          'Ian Period'as Protection_Period_Name,
          '2023-07-25' as Start_Date,
          '2023-07-19' as Updated_Date
      
          union
      
          select
          1 as nonpay_cancellations,
          1 as uw_cancellations,
          1 as expirations,
          1 as uw_nonrenewal,
          cast(64231 as int) as Zip_Code,
          'Ionia' as County ,
          '2023-07-19' as Created_Date,
          'ken.hebel@kin.com' as Created_By,
          '2023-08-05'as End_Date,
          'Ian Order' as Exec_Order_Name,
          'Ian Period'as Protection_Period_Name,
          '2023-07-25'as Start_Date,
          '2023-07-19' as Updated_Date
          
          )
          -- All policies with installment payments 2, 3 or 4 due within the PP
      SELECT bp.id
      , bst.due_date
      , m.*
      FROM bright_policies bp
      JOIN properties p ON bp.property_id = p.id
      JOIN addresses a ON a.id = p.address_id
      -- JOIN protection_periods pp ON a.county_fips = ANY(pp.counties_list)
      JOIN billing_scheduled_transactions bst ON bp.id = bst.bright_policy_id
      LEFT JOIN Mort_Table m on cast(m.county_code as int) = cast(a.county_fips as int)
        AND bst.installment_number IN (2,3,4)
        -- AND bst.due_date BETWEEN pp.starts_at AND pp.ends_at
        AND bst.due_date BETWEEN  cast(m.start_date as date) and cast(m.end_date as date)
      WHERE 0=0
      AND bp.status IN ('in_force')
      ORDER BY bp.id DESC LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: due_date {
    type: date
    sql: ${TABLE}."due_date" ;;
  }

  dimension: nonpay_cancellations {
    type: number
    sql: ${TABLE}."nonpay_cancellations" ;;
  }

  dimension: uw_cancellations {
    type: number
    sql: ${TABLE}."uw_cancellations" ;;
  }

  dimension: expirations {
    type: number
    sql: ${TABLE}."expirations" ;;
  }

  dimension: uw_nonrenewal {
    type: number
    sql: ${TABLE}."uw_nonrenewal" ;;
  }

  dimension: county_code {
    type: number
    sql: ${TABLE}."county_code" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."county" ;;
  }

  dimension: created_date {
    type: string
    sql: ${TABLE}."created_date" ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}."created_by" ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}."end_date" ;;
  }

  dimension: exec_order_name {
    type: string
    sql: ${TABLE}."exec_order_name" ;;
  }

  dimension: protection_period_name {
    type: string
    sql: ${TABLE}."protection_period_name" ;;
  }

  dimension: start_date {
    type: string
    sql: ${TABLE}."start_date" ;;
  }

  dimension: updated_date {
    type: string
    sql: ${TABLE}."updated_date" ;;
  }

  set: detail {
    fields: [
        id,
	due_date,
	nonpay_cancellations,
	uw_cancellations,
	expirations,
	uw_nonrenewal,
	county_code,
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
