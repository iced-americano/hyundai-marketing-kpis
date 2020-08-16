SELECT placement
    , ds
    , SUM(find_a_dealer_hvas) as find_a_dealer_hvas
    , SUM(byo_complete_hvas) as byo_complete_hvas
    , SUM(payment_calculator_hvas) AS payment_calculator_hvas /* Excluded from calculations because it is broken*/
    , SUM(search_inventory_results_hvas) AS search_inventory_results_hvas
    , SUM(edmunds_configurator_summary_hvas) AS edmunds_configurator_summary_hvas
    , SUM(edmunds_inventory_search_hvas) AS edmunds_inventory_search_hvas
    , SUM(edmunds_find_a_dealer_hvas) AS edmunds_find_a_dealer_hvas
    , SUM(kbb_build_price_summary_hvas) AS kbb_build_price_summary_hvas
    , SUM(all_leads_hvas) AS all_leads_hvas
    , SUM(kbb_lead_submission_form_hvas) AS kbb_lead_submission_form_hvas /* Excluded from calculations because it is broken */
    , SUM(kbb_request_a_quote_hvas) AS kbb_request_a_quote_hvas
    , SUM(edmunds_lead_submission_hvas) AS edmunds_lead_submission_hvas
    , SUM(edmunds_request_a_quote) AS edmunds_request_a_quote
FROM general_data
GROUP BY 1, 2