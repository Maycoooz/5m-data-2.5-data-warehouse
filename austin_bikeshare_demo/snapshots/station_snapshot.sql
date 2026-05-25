{% snapshot station_snapshot %}

{{
    config (
        target_schema='snapshots',
        unique_key='station_id',
        strategy='timestamp',
        updated_at='modified_date'
    )
}}

SELECT *
FROM {{ source('austin_bikeshare', 'bikeshare_stations') }}

{% endsnapshot %}