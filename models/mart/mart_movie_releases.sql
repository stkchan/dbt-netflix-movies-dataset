{{
  config(
    materialized = 'table',
    )
}}

WITH fact_ratings AS (
    SELECT
        *
    FROM
        {{ ref('fact_ratings') }}
)
, seed_dates AS (
    SELECT
        *
    FROM
        {{ ref('seed_movie_release_dates') }}
)

SELECT
    f.*,
    CASE
        WHEN d.release_date IS NULL THEN 'unknown'
        ELSE 'known'
    END AS release_info_available

FROM
    fact_ratings AS f
LEFT JOIN
    seed_dates   AS d
ON f.movie_id = d.movie_id