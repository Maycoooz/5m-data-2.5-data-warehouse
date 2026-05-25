SELECT
    station_id,
    name,
    status,
    location,
    address,
    property_type,
    number_of_docks,
    power_type,
    council_district
FROM {{ ref('station_snapshot') }}
WHERE CURRENT_TIMESTAMP > dbt_valid_from AND dbt_valid_to IS NULL