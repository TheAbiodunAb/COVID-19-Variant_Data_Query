      -- Questions -- 
-- What are the Variants
-- Total number of the Variants
-- What are the variants that emerge and then disappear


CREATE DATABASE `covid-19 variant`;
USE `covid-19 variant`;

SELECT * FROM `covid19_table`;


-- *** What are the Variants ***

SELECT DISTINCT `variant_name` FROM `covid19_table`;

SELECT DISTINCT `date` FROM `covid19_table`;
 
 
 -- *** Total number of the Variants ***
 
 SELECT `date`,`variant_name`, SUM(`specimens`) AS Total_specimens FROM `covid19_table`
 WHERE NOT `variant_name` = 'Total'
 GROUP BY `date`,`variant_name`;
 
 SELECT `date`,`variant_name` FROM `covid19_table`;
 
 
-- ALTER TABLE `covid19_variant` 
-- RENAME `covid19_table`;


 SELECT `variant_name`, SUM(`specimens`) AS Total_specimens FROM `covid19_table`
 WHERE NOT `variant_name` = 'Total'
 GROUP BY `variant_name`;
 
-- SELECT `date`, `variant_name`, `specimens` FROM `covid19_table`
-- WHERE `date` LIKE '%2023';  -- Use LIKE syntax to get 2023 only.  
 
-- *** Grand Total of 'Variant' within 2021 - 2023 ***


 SELECT SUM(`specimens`) AS Grand_Total_Variant FROM `covid19_table`
 WHERE `variant_name` IN
 ('Alpha','Lambda','Other','Epsilon','Omicron','Beta','Delta','Mu','Gamma');



-- *** What are the variants that emerge and then disappear ***
                                         
 SELECT `variant_name`, SUM(`specimens`) AS Total_specimens FROM `covid19_table`
 WHERE NOT `variant_name` = 'Total' AND `date` LIKE  '%2023'
 GROUP BY `variant_name`;
 
 -- NOTE:
 -- *** The Variants that emerge and then disappear are:
 -- 1) 'Alpha'
 -- 2) 'Epsilon'
 -- 3) 'Gamma'
 -- 4) 'Lambda'
 -- 5) 'Delta'
 -- 6) 'Mu'
 -- 7) 'Beta' ....   They are 7 in Total.
 
 
 -- *** Trend of disappearing from 2021 to 2023 ***

 SELECT `date`,`variant_name`, SUM(`specimens`) AS Total_specimens FROM `covid19_table`
 WHERE NOT `variant_name` = 'Total' AND `date` LIKE  '%2021'
 GROUP BY `date`,`variant_name`
 UNION 
 SELECT `date`,`variant_name`, SUM(`specimens`) AS Total_specimens FROM `covid19_table`
 WHERE NOT `variant_name` = 'Total' AND `date` LIKE  '%2022'
 GROUP BY `date`,`variant_name`
 UNION 
 SELECT `date`,`variant_name`, SUM(`specimens`) AS Total_specimens FROM `covid19_table`
 WHERE NOT `variant_name` = 'Total' AND `date` LIKE  '%2023'
 GROUP BY `date`,`variant_name`;


						   -- ***THANK YOU!!!***