WITH current_stations AS (
    SELECT *
    FROM {{ ref('station_snapshot') }}
    WHERE CURRENT_TIMESTAMP > dbt_valid_from AND dbt_valid_to IS NULL
)

SELECT
    s.station_id,
    s.name,
    s.status,
    s.location,
    s.address,
    AVG(t.duration_minutes) AS avg_duration
FROM current_stations AS s
LEFT JOIN {{ source('austin_bikeshare', 'bikeshare_trips') }} AS t
ON t.start_station_id = s.station_id
GROUP BY s.station_id, s.name, s.status, s.location, s.address
