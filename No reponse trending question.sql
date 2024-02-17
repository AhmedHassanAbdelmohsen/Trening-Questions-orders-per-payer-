SELECT 
           `odoo_cycle`.cycle_date
                        AS `Cycle` , 
                        
                        
             (sum(CASE WHEN `whatsapp_analysis`.`no_response` = 1 THEN 1 ELSE 0.0 END) / CASE WHEN count(*) = 0 THEN NULL ELSE count(*) END) AS `No Response Rate`
    FROM `whatsapp_analysis`
            LEFT JOIN `odoo_cycle` 
            ON `whatsapp_analysis`.`odoo_cyclce_id` = `odoo_cycle` .`odoo_cycle_id`
            
            
WHERE 

         ((`whatsapp_analysis`.`whatsapp_flow` <> '-'
    OR `whatsapp_analysis`.`whatsapp_flow` IS NULL)
   AND `whatsapp_analysis`.`whatsapp_flow` IS NOT NULL AND (`whatsapp_analysis`.`whatsapp_flow` <> '' OR `whatsapp_analysis`.`whatsapp_flow` IS NULL))
         
         
         
         
              
              [[AND `odoo_cycle`.`cycle_date` IN( ( SELECT CASE WHEN {{cycle}} = "Active Cycle" THEN MAX (`odoo_cycle`.`cycle_date`) ELSE (STR_TO_DATE(CONCAT( RIGHT({{cycle}}, 4), "-", SUBSTRING({{cycle}}, 1, LENGTH({{cycle}}) - 5) , "-", "01" ), "%Y-%M-%d")) END FROM `odoo_cycle`), 
                                          ( SELECT CASE WHEN {{cycle}} = "Active Cycle" THEN (MAX (`odoo_cycle`.`cycle_date`) - INTERVAL 1 MONTH) ELSE ((STR_TO_DATE(CONCAT( RIGHT({{cycle}}, 4), "-", SUBSTRING({{cycle}}, 1, LENGTH({{cycle}}) - 5) , "-", "01" ), "%Y-%M-%d")) - INTERVAL 1 MONTH) END FROM `odoo_cycle`)
                                        )
      ]]
      [[AND {{payer}}]]
      [[AND {{corporate}}]]
      [[AND {{Flow}}]]
    
        
 
GROUP BY  `odoo_cycle`.cycle_date
ORDER BY  `odoo_cycle`.cycle_date


