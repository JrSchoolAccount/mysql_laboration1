--
-- Uppgift 1
--
CREATE TABLE successful_mission AS
SELECT *
FROM moon_mission
WHERE outcome = 'Successful';
--
-- Uppgift 2
--
ALTER TABLE successful_mission
MODIFY mission_id SMALLINT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (mission_id);
--
-- Uppgift 3
--
UPDATE successful_mission
SET operator = REPLACE(operator, ' ', '')
WHERE operator LIKE '% %';
UPDATE moon_mission
SET operator = REPLACE(operator, ' ', '')
WHERE operator LIKE  '% %';
SELECT * FROM moon_mission;
--
-- Uppgift 4
--
DELETE FROM successful_mission
WHERE launch_date >= '2010-01-01';
--
-- Uppgift 5
--
SELECT *,
       CONCAT(first_name, ' ', last_name) AS name,
       CASE
           WHEN MOD(SUBSTR(ssn, -2, 1), 2) = 0 THEN 'female'
           ELSE 'male'
           END                            AS gender
FROM account;
