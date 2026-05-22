SELECT
    bike_id,
    LAST_VALUE(bike_type) OVER (PARTITION BY bike_id ORDER BY start_time) AS bike_type -- one bike had multiple bike types
FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}
WHERE bike_id IS NOT NULL
QUALIFY RANK() OVER (PARTITION BY bike_id ORDER BY start_time DESC) = 1 -- get the latest bike type of that specific bike
