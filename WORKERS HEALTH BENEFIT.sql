-- Create a Join table 
 Select*
 From Absenteeism_at_work  A
 Left Join compensation  B
 on A.ID = B.ID
 left join reasons r
 on A.`Reason for absence` = r.Number;
 
 -- Find the healthiest worker for the bonus 
 Select*
 From Absenteeism_at_work  A
 where `Social drinker` = 0 and `Social smoker` = 0
 and `Body mass index` < 25 and 
 `Absenteeism time in hours` < 
 (select avg(`Absenteeism time in hours`) 
 from absenteeism_at_work);
 
 -- Compensation increase for none-smokers/budget $983,221 so .69 increase per hour/ 1.414.4
 select count(*) as nonsmokers from absenteeism_at_work
 where `Social smoker`= 0;
 
 -- optimize this query so we can use it in making a dashboard 
 Select
 A.ID,
 r.Reason,
 `Month of absence`,
 `Body mass index`,
 CASE WHEN `Body mass index` <18.5 then 'underweight'
	  WHEN `Body mass index` between 18.5 and 25 then 'Healthy Weight'
      WHEN `Body mass index` between 25 and 30 then 'Over weight'
      WHEN `Body mass index` >30 then 'Obese'
      ELSE 'Unkown' end as BMI_Category,
 CASE WHEN `Month of absence` IN (12,1,2) THEN 'Winter'
	  WHEN `Month of absence` IN (3,4,5) THEN 'Spring'
      WHEN `Month of absence` IN (6,7,8) THEN 'Summer'
      WHEN `Month of absence` IN (9,10,11) THEN 'Fall'
      ELSE 'unkown' END as Season_Names,
 `Month of absence`,
 `Day of the week`,
 `Transportation expense`,
 Education,
 Son,
 `Social drinker`,
 `Social smoker`,
 Pet,
 `Disciplinary failure`,
 Age,
 `Work load Average/day`,
 `Absenteeism time in hours`
 From Absenteeism_at_work  A
 Left Join compensation  B
 on A.ID = B.ID
 left join reasons r
 on A.`Reason for absence` = r.Number;
 

