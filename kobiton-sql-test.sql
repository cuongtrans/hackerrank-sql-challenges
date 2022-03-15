-- Select top 3 unique devices that have the highest minutes consumed in the last 7 days (select udid and minute_consumed).
WITH minute_consumed_by_device AS (
SELECT DISTINCT D.udid, (MAX(endedAT) - MAX(startedAT)) as minute_consumed
FROM Sessions S
INNER JOIN Devices D
ON S.deviceId = D.id
GROUP BY D.udid)
SELECT udid, minute_consumed
FROM minute_consumed_by_device
ORDER BY minute_consumed DESC
FETCH FIRST 3 ROWS ONLY;






