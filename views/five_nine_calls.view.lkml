# The name of this view in Looker is "Five Nine Calls"
view: five_nine_calls {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.five_nine_calls ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called " Record ID" in Explore.

  dimension: _record_id {
    type: string
    sql: ${TABLE}."_record_id" ;;
  }

  dimension: abandoned {
    type: number
    sql: ${TABLE}."abandoned" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_abandoned {
    type: sum
    sql: ${abandoned} ;;  }
  measure: average_abandoned {
    type: average
    sql: ${abandoned} ;;  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}."agent_name" ;;
  }

  dimension: agent_userid {
    type: string
    sql: ${TABLE}."agent_userid" ;;
  }

  dimension: ani {
    type: string
    sql: ${TABLE}."ani" ;;
  }

  dimension: apitoken {
    type: string
    sql: ${TABLE}."apitoken" ;;
  }

  dimension: bill_time {
    type: string
    sql: ${TABLE}."bill_time" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: bound {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bound_date" ;;
  }

  dimension: call_id {
    type: string
    sql: ${TABLE}."call_id" ;;
  }

  dimension: call_time {
    type: string
    sql: ${TABLE}."call_time" ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}."call_type" ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."campaign_id" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."campaign_name" ;;
  }

  dimension: channelid {
    type: string
    sql: ${TABLE}."channelid" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}."comments" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."company" ;;
  }

  dimension: conference_time {
    type: string
    sql: ${TABLE}."conference_time" ;;
  }

  dimension: conferences {
    type: string
    sql: ${TABLE}."conferences" ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}."contact_id" ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}."cost" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension_group: created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_timestamp" ;;
  }

  dimension: crm_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."crm_account_id" ;;
  }

  dimension: declinery {
    type: yesno
    sql: ${TABLE}."declinery" ;;
  }

  dimension: disposition_id {
    type: string
    sql: ${TABLE}."disposition_id" ;;
  }

  dimension: disposition_name {
    type: string
    sql: ${TABLE}."disposition_name" ;;
  }

  dimension: dnis {
    type: string
    sql: ${TABLE}."dnis" ;;
  }

  dimension: do_not_call {
    type: string
    sql: ${TABLE}."do_not_call" ;;
  }

  dimension: domain_id {
    type: string
    sql: ${TABLE}."domain_id" ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}."domain_name" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: email_priority {
    type: string
    sql: ${TABLE}."email_priority" ;;
  }

  dimension_group: end_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."end_timestamp" ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}."error_code" ;;
  }

  dimension: error_desc {
    type: string
    sql: ${TABLE}."error_desc" ;;
  }

  dimension: first_agent {
    type: string
    sql: ${TABLE}."first_agent" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}."full_name" ;;
  }

  dimension: handle_time {
    type: string
    sql: ${TABLE}."handle_time" ;;
  }

  dimension: hold_time {
    type: string
    sql: ${TABLE}."hold_time" ;;
  }

  dimension: holds {
    type: number
    sql: ${TABLE}."holds" ;;
  }

  dimension: home_age {
    type: string
    sql: ${TABLE}."home_age" ;;
  }

  dimension: household_id {
    type: string
    sql: ${TABLE}."household_id" ;;
  }

  dimension: interaction_id {
    type: string
    sql: ${TABLE}."interaction_id" ;;
  }

  dimension: ivr_path {
    type: string
    sql: ${TABLE}."ivr_path" ;;
  }

  dimension: ivr_time {
    type: string
    sql: ${TABLE}."ivr_time" ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}."language" ;;
  }

  dimension_group: last_activity_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."last_activity_timestamp" ;;
  }

  dimension: last_agent {
    type: string
    sql: ${TABLE}."last_agent" ;;
  }

  dimension: last_campaign {
    type: string
    sql: ${TABLE}."last_campaign" ;;
  }

  dimension: last_disposition {
    type: string
    sql: ${TABLE}."last_disposition" ;;
  }

  dimension: last_module {
    type: string
    sql: ${TABLE}."last_module" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: last_sms {
    type: string
    sql: ${TABLE}."last_sms" ;;
  }

  dimension: last_state {
    type: string
    sql: ${TABLE}."last_state" ;;
  }

  dimension: length {
    type: string
    sql: ${TABLE}."length" ;;
  }

  dimension: live_connect {
    type: yesno
    sql: ${TABLE}."live_connect" ;;
  }

  dimension: loss_reason {
    type: string
    sql: ${TABLE}."loss_reason" ;;
  }

  dimension: main_recipient {
    type: string
    sql: ${TABLE}."main_recipient" ;;
  }

  dimension: mediatype {
    type: string
    sql: ${TABLE}."mediatype" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }

  dimension: number1 {
    type: string
    sql: ${TABLE}."number1" ;;
  }

  dimension: number2 {
    type: string
    sql: ${TABLE}."number2" ;;
  }

  dimension: number3 {
    type: string
    sql: ${TABLE}."number3" ;;
  }

  dimension: park_time {
    type: string
    sql: ${TABLE}."park_time" ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."person_id" ;;
  }

  dimension: preferred_language {
    type: string
    sql: ${TABLE}."preferred_language" ;;
  }

  dimension: published_time {
    type: string
    sql: ${TABLE}."published_time" ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}."question" ;;
  }

  dimension: queue_time {
    type: string
    sql: ${TABLE}."queue_time" ;;
  }

  dimension: recordings {
    type: string
    sql: ${TABLE}."recordings" ;;
  }

  dimension: ring_time {
    type: string
    sql: ${TABLE}."ring_time" ;;
  }

  dimension: sales_rep_owner {
    type: string
    sql: ${TABLE}."sales_rep_owner" ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}."session_id" ;;
  }

  dimension: short_code {
    type: string
    sql: ${TABLE}."short_code" ;;
  }

  dimension: skill_id {
    type: string
    sql: ${TABLE}."skill_id" ;;
  }

  dimension: skill_name {
    type: string
    sql: ${TABLE}."skill_name" ;;
  }

  dimension: sms_body {
    type: string
    sql: ${TABLE}."sms_body" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}."start_time" ;;
  }

  dimension_group: start_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_timestamp" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: station_id {
    type: string
    sql: ${TABLE}."station_id" ;;
  }

  dimension: station_type {
    type: string
    sql: ${TABLE}."station_type" ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}."street" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."subject" ;;
  }

  dimension: talk_time {
    type: string
    sql: ${TABLE}."talk_time" ;;
  }

  dimension: task_date {
    type: string
    sql: ${TABLE}."task_date" ;;
  }

  dimension_group: task_datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."task_datetime" ;;
  }

  dimension: tcpa_date_of_consent {
    type: string
    sql: ${TABLE}."tcpa_date_of_consent" ;;
  }

  dimension: thread_url {
    type: string
    sql: ${TABLE}."thread_url" ;;
  }

  dimension: to {
    type: string
    sql: ${TABLE}."to" ;;
  }

  dimension: total_body_bytes_size {
    type: string
    sql: ${TABLE}."total_body_bytes_size" ;;
  }

  dimension: total_body_chars_size {
    type: string
    sql: ${TABLE}."total_body_chars_size" ;;
  }

  dimension: transfers {
    type: number
    sql: ${TABLE}."transfers" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}."type_name" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."url" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."user_name" ;;
  }

  dimension: voicemails {
    type: number
    sql: ${TABLE}."voicemails" ;;
  }

  dimension: voicemails_declined {
    type: number
    sql: ${TABLE}."voicemails_declined" ;;
  }

  dimension: voicemails_handled {
    type: number
    sql: ${TABLE}."voicemails_handled" ;;
  }

  dimension: voicemails_returned_call {
    type: number
    sql: ${TABLE}."voicemails_returned_call" ;;
  }

  dimension: wrapup_time {
    type: string
    sql: ${TABLE}."wrapup_time" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."zip" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	agent_name,
	name,
	user_name,
	last_name,
	disposition_name,
	first_name,
	skill_name,
	campaign_name,
	full_name,
	type_name,
	domain_name,
	campaigns.name,
	campaigns.id,
	crm_accounts.id,
	contact_attempts.count
	]
  }

}
