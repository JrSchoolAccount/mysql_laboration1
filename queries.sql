--
-- Uppgift 1
--
CREATE TABLE successful_mission AS
SELECT *
FROM moon_mission
WHERE outcome = 'Successful';
--