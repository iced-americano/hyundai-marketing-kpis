WITH fct_hvas AS (
    SELECT SUM(
            find_a_dealer_hvas
            + byo_complete_hvas
            + payment_calculator_hvas /* Excluded from calculations because it is broken*/
            + search_inventory_results_hvas
            + edmunds_configurator_summary_hvas
            + edmunds_inventory_search_hvas
            + edmunds_find_a_dealer_hvas
            + kbb_build_price_summary_hvas
            + all_leads_hvas
            + kbb_lead_submission_form_hvas /* Excluded from calculations because it is broken */
            + kbb_request_a_quote_hvas
            + edmunds_lead_submission_hvas
            + edmunds_request_a_quote
        ) AS hvas
        , placement
        , ds
    FROM {{ ref('hva_floodlights') }}
    GROUP BY 2,3
)

, dim_placement AS (
    SELECT site
        , campaign
        , site_type
        , package
        , placement
        , tactic
        , audience_breakout_tactic
        , model
        , devices
        , platforms
        , sub_channel
        , ethnicity
        , age_demo
        , mon_sun_week
        , month
        , year
        , ds
    FROM {{ ref('placement') }}
)

SELECT dim_placement.site as site
    , dim_placement.campaign as campaign
    , dim_placement.site_type as site_type
    , dim_placement.package as package
    , dim_placement.placement as placement
    , dim_placement.tactic as tactic
    , dim_placement.audience_breakout_tactic as audience_tactic
    , dim_placement.model as model
    , fct_hvas.hvas as hvas
    , dim_placement.devices as devices
    , dim_placement.platforms as platforms
    , dim_placement.sub_channel as sub_channel
    , dim_placement.ethnicity as ethnicity
    , dim_placement.age_demo as age_demo
    , dim_placement.mon_sun_week as mon_sun_week
    , dim_placement.month as month
    , dim_placement.year as year
    , dim_placement.ds as ds
FROM dim_placement as dim_placement
JOIN fct_hvas as fct_hvas 
ON dim_placement.placement = fct_hvas.placement
AND dim_placement.ds = fct_hvas.ds
