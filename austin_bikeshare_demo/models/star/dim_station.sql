SELECT DISTINCT
    station_id,
    name,
    status,
    location,
    address
FROM {{ ref('station_snapshot')}}
WHERE CURRENT_TIMESTAMP > dbt_valid_from AND dbt_valid_to IS NULL
