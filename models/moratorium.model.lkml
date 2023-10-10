# Define the database connection to be used for this model.
connection: "data_castle"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: moratorium_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: moratorium_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Moratorium"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: protection_period_policies {
  label: "Protection Period"
  view_label: "Policies"

  join: protection_period_claims {
    type: left_outer
    relationship: one_to_one
    view_label: "Claims"
    sql_on: ${protection_period_policies.bright_policy_id} = ${protection_period_claims.bright_policy_id} ;;
  }

  join: protection_period_policy_events {
    view_label: "Policy Events"
    type: left_outer
    relationship: one_to_many
    sql_on: ${protection_period_policies.bright_policy_id} = ${protection_period_policy_events.bright_policy_id}  ;;
  }

  join: protection_period_correcting_events {
    view_label: "PP Correcting Events"
    type: left_outer
    relationship: one_to_many
    sql_on: ${protection_period_policies.bright_policy_id} = ${protection_period_correcting_events.bright_policy_id}  ;;
  }

  join: protection_period_critical_notices {
    view_label: "PP Critical Notices"
    type: left_outer
    relationship: one_to_many
    sql_on: ${protection_period_policies.bright_policy_id} = ${protection_period_critical_notices.bright_policy_id}  ;;
  }

  join: protection_period_billing_transactions_all {
    view_label: "Billing Transactions"
    type: left_outer
    relationship: one_to_many
    sql_on: ${protection_period_policies.bright_policy_id} = ${protection_period_billing_transactions_all.bright_policy_id}  ;;
  }

  join: protection_period_billing_transactions_order {
    view_label: "Billing Transactions Out of Order"
    type: left_outer
    relationship: one_to_many
    sql_on: ${protection_period_policies.bright_policy_id} = ${protection_period_billing_transactions_order.bright_policy_id}  ;;
  }

}




explore: morat_all {}

explore: cancel_all {}

explore: cancel_filter {}

explore: cancel_email {}

explore: pending_cancelation_view{}

explore: pending_renewal_view{}

explore: installment_view{}


explore: nonrenewalexplore{}

explore: nonrenewed_determination{}

explore: expiration_nap{}

explore: expiration{}

explore: cancellations {}

#explore: accounting_balance_reports {}
#
#explore: accounting_metadata {
#  join: policy_events {
#    type: left_outer
#    sql_on: ${accounting_metadata.policy_event_id} = ${policy_events.id} ;;
#    relationship: many_to_one
#  }
#
#  join: effective_policy_snapshots {
#    type: left_outer
#    sql_on: ${policy_events.effective_policy_snapshot_ids} = ${effective_policy_snapshots.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${policy_events.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: acquisition_components {}
#
#explore: acquisition_experiments {}
#
#explore: acquisition_flows {}
#
#explore: acquisition_page_components {
#  join: acquisition_components {
#    type: left_outer
#    sql_on: ${acquisition_page_components.acquisition_component_id} = ${acquisition_components.id} ;;
#    relationship: many_to_one
#  }
#
#  join: acquisition_pages {
#    type: left_outer
#    sql_on: ${acquisition_page_components.acquisition_page_id} = ${acquisition_pages.id} ;;
#    relationship: many_to_one
#  }
#
#  join: acquisition_flows {
#    type: left_outer
#    sql_on: ${acquisition_pages.acquisition_flow_id} = ${acquisition_flows.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: acquisition_pages {
#  join: acquisition_flows {
#    type: left_outer
#    sql_on: ${acquisition_pages.acquisition_flow_id} = ${acquisition_flows.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: active_storage_attachments {}
#
#explore: active_storage_blobs {}
#
#explore: address_versions {}
#
#explore: addresses {}
#
#explore: analytics_metadata {}
#
#explore: ar_internal_metadata {}
#
#explore: automated_bookrolls {
#  join: batch_job_runs {
#    type: left_outer
#    sql_on: ${automated_bookrolls.batch_job_run_id} = ${batch_job_runs.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: automation_hero_ocr_windstorm_mitigations {}
#
#explore: awsdms_ddl_audit {}
#
#explore: batch_job_runs {}
#
#explore: billing_balance_reports {}
#
#explore: billing_draft_transactions {
#  join: renewal_endorsement_requests {
#    type: left_outer
#    sql_on: ${billing_draft_transactions.renewal_endorsement_request_id} = ${renewal_endorsement_requests.id} ;;
#    relationship: many_to_one
#  }
#
#  join: endorsement_requests {
#    type: left_outer
#    sql_on: ${billing_draft_transactions.endorsement_request_id} = ${endorsement_requests.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: billing_scheduled_transactions {
#  join: endorsement_requests {
#    type: left_outer
#    sql_on: ${billing_scheduled_transactions.endorsement_request_id} = ${endorsement_requests.id} ;;
#    relationship: many_to_one
#  }
#
#  join: renewal_endorsement_requests {
#    type: left_outer
#    sql_on: ${billing_scheduled_transactions.renewal_endorsement_request_id} = ${renewal_endorsement_requests.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: blockers {}
#
#explore: boberdoo_raw_responses {}
#
#explore: boundary_consumers {}
#
#explore: bright_mortgagees {}
#
#explore: bright_policies {
#  join: custom_quotes {
#    type: left_outer
#    sql_on: ${bright_policies.custom_quote_id} = ${custom_quotes.id} ;;
#    relationship: many_to_one
#  }
#
#  join: coverages {
#    type: left_outer
#    sql_on: ${bright_policies.coverage_id} = ${coverages.id} ;;
#    relationship: many_to_one
#  }
#
#  join: coverage_versions {
#    type: left_outer
#    sql_on: ${bright_policies.coverage_version_id} = ${coverage_versions.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${bright_policies.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: property_versions {
#    type: left_outer
#    sql_on: ${bright_policies.property_version_id} = ${property_versions.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${custom_quotes.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: bright_policy_versions {}
#
#explore: bright_third_party_sales {
#  join: products {
#    type: left_outer
#    sql_on: ${bright_third_party_sales.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: brite_verify_raw_responses {}
#
#explore: build_zoom_building_permit_lists {}
#
#explore: build_zoom_building_permits {
#  join: build_zoom_building_permit_lists {
#    type: left_outer
#    sql_on: ${build_zoom_building_permits.build_zoom_building_permit_list_id} = ${build_zoom_building_permit_lists.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: build_zoom_property_matches {}
#
#explore: buildfax_locations {}
#
#explore: bulk_refund_approval_details {
#  join: bulk_refund_approvals {
#    type: left_outer
#    sql_on: ${bulk_refund_approval_details.bulk_refund_approval_id} = ${bulk_refund_approvals.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: bulk_refund_approvals {}
#
#explore: campaigns {}
#
#explore: cancellation_metadata {
#  join: policy_events {
#    type: left_outer
#    sql_on: ${cancellation_metadata.policy_event_id} = ${policy_events.id} ;;
#    relationship: many_to_one
#  }
#
#  join: effective_policy_snapshots {
#    type: left_outer
#    sql_on: ${policy_events.effective_policy_snapshot_ids} = ${effective_policy_snapshots.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${policy_events.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: cape_locations {}
#
#explore: checkbook_io_responses {}
#
#explore: claim_codes {}
#
#explore: claim_payments {
#  join: claims {
#    type: left_outer
#    sql_on: ${claim_payments.claim_id} = ${claims.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: claim_sources {
#  join: claims {
#    type: left_outer
#    sql_on: ${claim_sources.claim_id} = ${claims.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: claims {}
#
#explore: click_leads {
#  join: customer_input_responses {
#    type: left_outer
#    sql_on: ${click_leads.customer_input_response_id} = ${customer_input_responses.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: consents {
#  join: users {
#    type: left_outer
#    sql_on: ${consents.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#
#  join: document_templates {
#    type: left_outer
#    sql_on: ${consents.document_template_id} = ${document_templates.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: contact_attempts {
#  join: csrs {
#    type: left_outer
#    sql_on: ${contact_attempts.csr_id} = ${csrs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: five_nine_calls {
#    type: left_outer
#    sql_on: ${contact_attempts.five_nine_call_id} = ${five_nine_calls.id} ;;
#    relationship: many_to_one
#  }
#
#  join: crm_accounts {
#    type: left_outer
#    sql_on: ${contact_attempts.crm_account_id} = ${crm_accounts.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#
#  join: campaigns {
#    type: left_outer
#    sql_on: ${five_nine_calls.campaign_id} = ${campaigns.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: county_fips_mappings {}
#
#explore: coverage_acknowledgements {
#  join: coverages {
#    type: left_outer
#    sql_on: ${coverage_acknowledgements.coverage_id} = ${coverages.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: coverage_versions {}
#
#explore: coverages {}
#
#explore: credit_cards {}
#
#explore: critical_notice_events {
#  join: policy_emails {
#    type: left_outer
#    sql_on: ${critical_notice_events.policy_email_id} = ${policy_emails.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: crm_account_versions {}
#
#explore: crm_accounts {}
#
#explore: crm_assignment_versions {}
#
#explore: crm_assignments {
#  join: crm_accounts {
#    type: left_outer
#    sql_on: ${crm_assignments.crm_account_id} = ${crm_accounts.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: csr_lead_versions {}
#
#explore: csr_notifications {
#  join: csrs {
#    type: left_outer
#    sql_on: ${csr_notifications.csr_id} = ${csrs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: csr_quotes {
#  join: csrs {
#    type: left_outer
#    sql_on: ${csr_quotes.csr_id} = ${csrs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${csr_quotes.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: csrs {
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: custom_quotes {
#  join: ratings {
#    type: left_outer
#    sql_on: ${custom_quotes.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: customer_input_events {
#  join: customer_input_responses {
#    type: left_outer
#    sql_on: ${customer_input_events.customer_input_response_id} = ${customer_input_responses.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: customer_input_response_versions {}
#
#explore: customer_input_responses {}
#
#explore: customer_io_api_interactions {
#  join: users {
#    type: left_outer
#    sql_on: ${customer_io_api_interactions.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: data_automation_logs {}
#
#explore: data_migrations {}
#
#explore: database_metrics {}
#
#explore: datadog_status_alerts {}
#
#explore: docsets {}
#
#explore: document_communication_versions {}
#
#explore: document_communications {
#  join: docsets {
#    type: left_outer
#    sql_on: ${document_communications.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: document_metadata {
#  join: documents {
#    type: left_outer
#    sql_on: ${document_metadata.document_id} = ${documents.id} ;;
#    relationship: many_to_one
#  }
#
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: document_templates {}
#
#explore: documents {
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: e2_value_responses {}
#
#explore: effective_policy_snapshot_versions {}
#
#explore: effective_policy_snapshots {
#  join: policy_events {
#    type: left_outer
#    sql_on: ${effective_policy_snapshots.policy_event_id} = ${policy_events.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${policy_events.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: endorsement_requests {}
#
#explore: estated_property_details {}
#
#explore: estated_v4_property_details {}
#
#explore: event_reasons {}
#
#explore: event_store_events {}
#
#explore: event_store_events_in_streams {}
#
#explore: everyone_api_raw_responses {
#  join: phones {
#    type: left_outer
#    sql_on: ${everyone_api_raw_responses.phone_id} = ${phones.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: experiment_results {
#  join: customer_input_responses {
#    type: left_outer
#    sql_on: ${experiment_results.customer_input_response_id} = ${customer_input_responses.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: external_book_imports {}
#
#explore: external_book_policies {
#  join: external_book_imports {
#    type: left_outer
#    sql_on: ${external_book_policies.external_book_import_id} = ${external_book_imports.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: external_policies {
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${external_policies.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: filing_rate_locks {}
#
#explore: five_nine_agent_states {}
#
#explore: five_nine_call_versions {}
#
#explore: five_nine_calls {
#  join: campaigns {
#    type: left_outer
#    sql_on: ${five_nine_calls.campaign_id} = ${campaigns.id} ;;
#    relationship: many_to_one
#  }
#
#  join: crm_accounts {
#    type: left_outer
#    sql_on: ${five_nine_calls.crm_account_id} = ${crm_accounts.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: five_nine_reports {}
#
#explore: geo_data_locations {}
#
#explore: geography_columns {}
#
#explore: geometry_columns {}
#
#explore: geovera_earthquake_policies {}
#
#explore: google_maps_data_locations {}
#
#explore: hazard_hub_plus_locations {}
#
#explore: historical_policy_ratings {
#  join: ratings {
#    type: left_outer
#    sql_on: ${historical_policy_ratings.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: inflation_factors {}
#
#explore: inflation_imports {}
#
#explore: inspection_metadata {}
#
#explore: inspection_photos {
#  join: niis_inspection_results {
#    type: left_outer
#    sql_on: ${inspection_photos.niis_inspection_result_id} = ${niis_inspection_results.id} ;;
#    relationship: many_to_one
#  }
#
#  join: documents {
#    type: left_outer
#    sql_on: ${niis_inspection_results.document_id} = ${documents.id} ;;
#    relationship: many_to_one
#  }
#
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: insurance_carrier_versions {}
#
#explore: insurance_carriers {}
#
#explore: insurance_scores {
#  join: products {
#    type: left_outer
#    sql_on: ${insurance_scores.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: intake_tokens {
#  join: users {
#    type: left_outer
#    sql_on: ${intake_tokens.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: interaction_events {}
#
#explore: kindo_database_condo_versions {}
#
#explore: kindo_database_condos {
#  join: kindo_database_imports {
#    type: left_outer
#    sql_on: ${kindo_database_condos.kindo_database_import_id} = ${kindo_database_imports.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: kindo_database_imports {}
#
#explore: kustomer_crm_assignments {
#  join: crm_accounts {
#    type: left_outer
#    sql_on: ${kustomer_crm_assignments.crm_account_id} = ${crm_accounts.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: kustomer_people {
#  join: crm_accounts {
#    type: left_outer
#    sql_on: ${kustomer_people.crm_account_id} = ${crm_accounts.id} ;;
#    relationship: many_to_one
#  }
#
#  join: promo_code_file_imports {
#    type: left_outer
#    sql_on: ${kustomer_people.promo_code_file_import_id} = ${promo_code_file_imports.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${kustomer_people.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: kustomer_users {
#  join: users {
#    type: left_outer
#    sql_on: ${kustomer_users.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: lead_assigners {}
#
#explore: lead_attributions {}
#
#explore: lead_providers {}
#
#explore: lead_scores {}
#
#explore: lead_sources {}
#
#explore: lexis_claims {}
#
#explore: lexis_ncfs {}
#
#explore: lifecycle_rule_overrides {
#  join: lifecycle_rules {
#    type: left_outer
#    sql_on: ${lifecycle_rule_overrides.lifecycle_rule_id} = ${lifecycle_rules.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${lifecycle_rules.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: lifecycle_rule_versions {}
#
#explore: lifecycle_rules {
#  join: products {
#    type: left_outer
#    sql_on: ${lifecycle_rules.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: lockbox_details {
#  join: lockbox_file_imports {
#    type: left_outer
#    sql_on: ${lockbox_details.lockbox_file_import_id} = ${lockbox_file_imports.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: lockbox_file_imports {}
#
#explore: loss_reasons {}
#
#explore: maestro_results {}
#
#explore: marketing_leads_for_new_states {}
#
#explore: melissa_construction_codes {}
#
#explore: melissa_ext_wall_codes {}
#
#explore: melissa_personators {}
#
#explore: melissa_property_lookups {}
#
#explore: melissa_roof_types {}
#
#explore: moratoria {
#  join: national_weather_service_alerts {
#    type: left_outer
#    sql_on: ${moratoria.national_weather_service_alert_id} = ${national_weather_service_alerts.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: national_weather_service_alerts {}
#
#explore: near_map_images {
#  join: near_map_locations {
#    type: left_outer
#    sql_on: ${near_map_images.near_map_location_id} = ${near_map_locations.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: near_map_locations {}
#
#explore: near_map_surveys_requests {
#  join: near_map_locations {
#    type: left_outer
#    sql_on: ${near_map_surveys_requests.near_map_location_id} = ${near_map_locations.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: niis_inspection_orders {
#  join: inspection_metadata {
#    type: left_outer
#    sql_on: ${niis_inspection_orders.inspection_metadata_id} = ${inspection_metadata.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: niis_inspection_result_raw_responses {
#  join: niis_inspection_results {
#    type: left_outer
#    sql_on: ${niis_inspection_result_raw_responses.niis_inspection_result_id} = ${niis_inspection_results.id} ;;
#    relationship: many_to_one
#  }
#
#  join: documents {
#    type: left_outer
#    sql_on: ${niis_inspection_results.document_id} = ${documents.id} ;;
#    relationship: many_to_one
#  }
#
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: niis_inspection_results {
#  join: documents {
#    type: left_outer
#    sql_on: ${niis_inspection_results.document_id} = ${documents.id} ;;
#    relationship: many_to_one
#  }
#
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: note_versions {}
#
#explore: notes {}
#
#explore: ofac_sanctioned_individuals {}
#
#explore: ofac_sanctioned_match_versions {}
#
#explore: ofac_sanctioned_matches {
#  join: ofac_sanctioned_individuals {
#    type: left_outer
#    sql_on: ${ofac_sanctioned_matches.ofac_sanctioned_individual_id} = ${ofac_sanctioned_individuals.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: opportunities {}
#
#explore: opportunities_people {}
#
#explore: organization_versions {}
#
#explore: organizations {}
#
#explore: packet_document_versions {}
#
#explore: packet_documents {
#  join: static_document_templates {
#    type: left_outer
#    sql_on: ${packet_documents.static_document_template_id} = ${static_document_templates.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${packet_documents.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: payment_methods {
#  join: credit_cards {
#    type: left_outer
#    sql_on: ${payment_methods.credit_card_id} = ${credit_cards.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: payments {
#  join: payment_methods {
#    type: left_outer
#    sql_on: ${payments.payment_method_id} = ${payment_methods.id} ;;
#    relationship: many_to_one
#  }
#
#  join: credit_cards {
#    type: left_outer
#    sql_on: ${payment_methods.credit_card_id} = ${credit_cards.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: people {
#  join: users {
#    type: left_outer
#    sql_on: ${people.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#
#  join: crm_accounts {
#    type: left_outer
#    sql_on: ${people.crm_account_id} = ${crm_accounts.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: people_versions {}
#
#explore: permitted_ips {}
#
#explore: person_documents {}
#
#explore: pg_stat_statements {
#  join: users {
#    type: left_outer
#    sql_on: ${pg_stat_statements.userid} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: phones {}
#
#explore: plutus_accounts {}
#
#explore: plutus_amounts {}
#
#explore: plutus_entries {
#  join: users {
#    type: left_outer
#    sql_on: ${plutus_entries.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_activities {}
#
#explore: policy_administration_effective_policies {}
#
#explore: policy_administration_effective_policy_comparison_results {}
#
#explore: policy_applications {
#  join: documents {
#    type: left_outer
#    sql_on: ${policy_applications.document_id} = ${documents.id} ;;
#    relationship: many_to_one
#  }
#
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_billing_balance_reports {
#  join: billing_balance_reports {
#    type: left_outer
#    sql_on: ${policy_billing_balance_reports.billing_balance_report_id} = ${billing_balance_reports.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_contact_versions {}
#
#explore: policy_contacts {
#  join: payment_methods {
#    type: left_outer
#    sql_on: ${policy_contacts.payment_method_id} = ${payment_methods.id} ;;
#    relationship: many_to_one
#  }
#
#  join: credit_cards {
#    type: left_outer
#    sql_on: ${payment_methods.credit_card_id} = ${credit_cards.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_emails {}
#
#explore: policy_event_reasons {
#  join: policy_events {
#    type: left_outer
#    sql_on: ${policy_event_reasons.policy_event_id} = ${policy_events.id} ;;
#    relationship: many_to_one
#  }
#
#  join: event_reasons {
#    type: left_outer
#    sql_on: ${policy_event_reasons.event_reason_id} = ${event_reasons.id} ;;
#    relationship: many_to_one
#  }
#
#  join: effective_policy_snapshots {
#    type: left_outer
#    sql_on: ${policy_events.effective_policy_snapshot_ids} = ${effective_policy_snapshots.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${policy_events.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_event_versions {}
#
#explore: policy_events {
#  join: effective_policy_snapshots {
#    type: left_outer
#    sql_on: ${policy_events.effective_policy_snapshot_ids} = ${effective_policy_snapshots.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${policy_events.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_job_runs {
#  join: policy_events {
#    type: left_outer
#    sql_on: ${policy_job_runs.policy_event_id} = ${policy_events.id} ;;
#    relationship: many_to_one
#  }
#
#  join: batch_job_runs {
#    type: left_outer
#    sql_on: ${policy_job_runs.batch_job_run_id} = ${batch_job_runs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: effective_policy_snapshots {
#    type: left_outer
#    sql_on: ${policy_events.effective_policy_snapshot_ids} = ${effective_policy_snapshots.id} ;;
#    relationship: many_to_one
#  }
#
#  join: ratings {
#    type: left_outer
#    sql_on: ${policy_events.rating_id} = ${ratings.id} ;;
#    relationship: many_to_one
#  }
#
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_packets {
#  join: policy_contacts {
#    type: left_outer
#    sql_on: ${policy_packets.policy_contact_id} = ${policy_contacts.id} ;;
#    relationship: many_to_one
#  }
#
#  join: documents {
#    type: left_outer
#    sql_on: ${policy_packets.document_id} = ${documents.id} ;;
#    relationship: many_to_one
#  }
#
#  join: payment_methods {
#    type: left_outer
#    sql_on: ${policy_contacts.payment_method_id} = ${payment_methods.id} ;;
#    relationship: many_to_one
#  }
#
#  join: credit_cards {
#    type: left_outer
#    sql_on: ${payment_methods.credit_card_id} = ${credit_cards.id} ;;
#    relationship: many_to_one
#  }
#
#  join: docsets {
#    type: left_outer
#    sql_on: ${documents.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: policy_renewal_scheduling_state {}
#
#explore: policy_service_failures {}
#
#explore: policy_versions {}
#
#explore: postal_notice_events {}
#
#explore: product_deadline_versions {}
#
#explore: product_deadlines {
#  join: products {
#    type: left_outer
#    sql_on: ${product_deadlines.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: products {
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: promo_code_details {
#  join: promo_code_file_imports {
#    type: left_outer
#    sql_on: ${promo_code_details.promo_code_file_import_id} = ${promo_code_file_imports.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: promo_code_file_imports {}
#
#explore: properties {}
#
#explore: property_decorations {}
#
#explore: property_versions {}
#
#explore: protection_periods {}
#
#explore: provider_payments {}
#
#explore: rates_testing_scenarios {}
#
#explore: ratings {
#  join: products {
#    type: left_outer
#    sql_on: ${ratings.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: referrals {
#  join: customer_input_responses {
#    type: left_outer
#    sql_on: ${referrals.customer_input_response_id} = ${customer_input_responses.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: renewal_endorsement_requests {}
#
#explore: renewal_flags {}
#
#explore: renewal_flags_imports {}
#
#explore: roles {}
#
#explore: roof_eligibilities {
#  join: products {
#    type: left_outer
#    sql_on: ${roof_eligibilities.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }
#
#  join: insurance_carriers {
#    type: left_outer
#    sql_on: ${products.insurance_carrier_id} = ${insurance_carriers.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: roof_eligibility_versions {}
#
#explore: scheduled_renewal_changes {}
#
#explore: scheduled_transaction_versions {}
#
#explore: schema_migrations {}
#
#explore: screenshots {}
#
#explore: slack_notifications {}
#
#explore: smarty_streets_calls {}
#
#explore: spatial_ref_sys {}
#
#explore: static_document_templates {}
#
#explore: swissre_scores {}
#
#explore: tasks {
#  join: csrs {
#    type: left_outer
#    sql_on: ${tasks.csr_id} = ${csrs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: third_party_sales {}
#
#explore: twilio_faxes {
#  join: docsets {
#    type: left_outer
#    sql_on: ${twilio_faxes.docset_id} = ${docsets.id} ;;
#    relationship: many_to_one
#  }
#
#  join: csrs {
#    type: left_outer
#    sql_on: ${twilio_faxes.csr_id} = ${csrs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: twilio_sms_messages {
#  join: csrs {
#    type: left_outer
#    sql_on: ${twilio_sms_messages.csr_id} = ${csrs.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${csrs.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: underwriting_decisions {
#  join: users {
#    type: left_outer
#    sql_on: ${underwriting_decisions.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: us_counties {}
#
#explore: user_versions {}
#
#explore: users {}
#
#explore: users_roles {
#  join: roles {
#    type: left_outer
#    sql_on: ${users_roles.role_id} = ${roles.id} ;;
#    relationship: many_to_one
#  }
#
#  join: users {
#    type: left_outer
#    sql_on: ${users_roles.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: validated_property_attributes {}
#
#explore: validated_windstorm_mitigations {}
#
#explore: validation_checks {
#  join: validation_runs {
#    type: left_outer
#    sql_on: ${validation_checks.validation_run_id} = ${validation_runs.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: validation_runs {}
#
#explore: velocity_claim_exports {}
#
#explore: velocity_claims {}
#
#explore: velocity_exports {}
#
#explore: velocity_policies {}
#
#explore: velocity_territories {}
#
#explore: verisk_a_plus_calls {}
#
#explore: verisk_fire_lines {}
#
#explore: verisk_location_raw_responses {
#  join: verisk_locations {
#    type: left_outer
#    sql_on: ${verisk_location_raw_responses.verisk_location_id} = ${verisk_locations.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: verisk_locations {}
#
#explore: verisk_prefill_raw_responses {
#  join: verisk_prefills {
#    type: left_outer
#    sql_on: ${verisk_prefill_raw_responses.verisk_prefill_id} = ${verisk_prefills.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: verisk_prefills {}
#
#explore: verisk_valuation_raw_responses {
#  join: verisk_valuations {
#    type: left_outer
#    sql_on: ${verisk_valuation_raw_responses.verisk_valuation_id} = ${verisk_valuations.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: verisk_valuations {}
#
#explore: wildfire_mitigation_discounts {}
#
#explore: zillow_home_valuations {}
#
#explore: zillow_property_detail_updates {
#  join: zillow_property_details {
#    type: left_outer
#    sql_on: ${zillow_property_detail_updates.zillow_property_detail_id} = ${zillow_property_details.id} ;;
#    relationship: many_to_one
#  }
#}
#
#explore: zillow_property_details {}
