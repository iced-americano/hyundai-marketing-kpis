WITH cte AS (
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
        , MAX(ds) as ds
        , mon_sun_week
        , month
        , year
    FROM general_data
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17
)

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
FROM CTE

