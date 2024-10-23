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
