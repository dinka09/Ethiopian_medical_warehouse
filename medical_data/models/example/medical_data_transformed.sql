{{config(materialized='table')}}
WITH filtered_medical_data AS (
  SELECT * FROM {{source('public', 'medical_data')}} WHERE views > 0
  AND id >= 0
)

SELECT
    id,
    channel_title,    
    views,
    message,
    date,
    message_link
FROM filtered_medical_data