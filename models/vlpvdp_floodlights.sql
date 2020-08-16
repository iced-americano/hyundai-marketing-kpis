SELECT placement
    , ds
    , SUM(search_inventory_page_vlp_vdps) AS search_inventory_page_vlp_vdps
    , SUM(model_detail_page_vlp_vdps) AS model_detail_page_vlp_vdps
    , SUM(vehicle_detail_page_vlpvdps) AS vehicle_detail_page_vlpvdps 
FROM general_data
GROUP BY 1, 2
