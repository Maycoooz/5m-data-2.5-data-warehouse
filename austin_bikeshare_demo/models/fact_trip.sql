SELECT
    trip_id,
    bike_id,
    SAFE_CAST(start_station_id AS INT64) AS start_station_id,
    SAFE_CAST(end_station_id AS INT64) AS end_station_id,
    subscriber_type,
    start_time,
    duration_minutes
FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}
