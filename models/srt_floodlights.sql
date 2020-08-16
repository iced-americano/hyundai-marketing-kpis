SELECT placement
    , ds
    , SUM(place_iq * 0.20201) as place_iq /* Traffic factor multiplier is added */
FROM general_data
GROUP BY 1, 2