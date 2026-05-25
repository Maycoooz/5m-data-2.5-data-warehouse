SELECT DISTINCT
    council_district
FROM {{ ref('station_snapshot' )}}
WHERE CURRENT_TIMESTAMP > dbt_valid_from AND dbt_valid_to IS NULL