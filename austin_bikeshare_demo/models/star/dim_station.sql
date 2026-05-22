SELECT DISTINCT
    station_id,
    name,
    status,
    location,
    address
FROM {{ source('austin_bikeshare', 'bikeshare_stations')}}
