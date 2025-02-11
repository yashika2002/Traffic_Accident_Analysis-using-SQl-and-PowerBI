-- retrive all data from the table
SELECT 
    *
FROM
    traffic_accidents;

-- count of data
SELECT 
    COUNT(*)
FROM
    traffic_accidents;

-- list of years and no of accidents  per year(2014 not there)
SELECT 
    YEAR(crash_date) AS years, COUNT(crash_date) AS no_of_acc
FROM
    traffic_accidents
GROUP BY years
ORDER BY years;

 -- acc top 5 peak hours
SELECT 
    COUNT(crash_date) AS num_accidents, crash_hour
FROM
    traffic_accidents
GROUP BY crash_hour
ORDER BY num_accidents DESC
LIMIT 5;


-- hour by hour info 
SELECT 
    EXTRACT(HOUR FROM crash_hour) AS hours,
    COUNT(crash_date) AS num_acc
FROM
    traffic_accidents
GROUP BY crash_hour
ORDER BY crash_hour;

-- accidents acc to months
SELECT 
    COUNT(crash_date) AS cnt, crash_month
FROM
    traffic_accidents
GROUP BY crash_month
ORDER BY cnt DESC;

-- accdents acc to days of the week
SELECT 
    COUNT(crash_date) AS cnt, crash_day_of_week
FROM
    traffic_accidents
GROUP BY crash_day_of_week
ORDER BY cnt DESC;

-- acc in diiferent weather conditions
SELECT 
    COUNT(crash_date) AS num, weather_condition
FROM
    traffic_accidents
GROUP BY weather_condition
ORDER BY num DESC;

-- acc in different ligting conditions
SELECT 
    COUNT(crash_date), lighting_condition
FROM
    traffic_accidents
GROUP BY lighting_condition;

-- acc count with case of injury
SELECT 
    COUNT(crash_date) AS num, most_severe_injury
FROM
    traffic_accidents
GROUP BY most_severe_injury
ORDER BY num DESC;

-- acc due to traffic_way type 
SELECT 
    COUNT(crash_date) AS num, trafficway_type
FROM
    traffic_accidents
GROUP BY trafficway_type
ORDER BY num DESC;

-- acc due to roads 
SELECT 
    COUNT(crash_date) AS num_acc, roadway_surface_cond
FROM
    traffic_accidents
GROUP BY roadway_surface_cond
ORDER BY num_acc DESC;

-- acc in case od =f road defects
SELECT 
    COUNT(crash_date) AS num_acc, road_defect
FROM
    traffic_accidents
WHERE
    road_defect != 'No defects'
GROUP BY road_defect
ORDER BY num_acc DESC;

-- num of vechiles imvolved in the injury cases
SELECT 
    COUNT(num_units) AS num_of_vehicles, most_severe_injury
FROM
    traffic_accidents
GROUP BY most_severe_injury
ORDER BY num_of_vehicles DESC;

-- acc due to various causes
SELECT 
    COUNT(crash_date) AS acc_num, prim_contributory_cause
FROM
    traffic_accidents
WHERE
    prim_contributory_cause NOT IN ('Not applicable' , 'unable to determine')
GROUP BY prim_contributory_cause
ORDER BY acc_num DESC;

-- damage done due to acc
SELECT 
    damage, COUNT(crash_date) AS num_acc
FROM
    traffic_accidents
GROUP BY damage
ORDER BY num_acc DESC;

-- records for the number of vehciles involved in accident more than 4
select count(crash_date) as num_acc,num_units as num_of_vehicles from traffic_accidents
group by num_units
having num_units>4
order by num_acc desc;

-- records for acc having total injuries more than 2
select count(crash_date) as num_acc,injuries_total from traffic_accidents
group by injuries_total
having injuries_total>2
order by num_acc desc;

-- count of accidents where injuries are more than 3
SELECT 
    COUNT(crash_date) AS num_acc
FROM traffic_accidents
WHERE injuries_total > 3





