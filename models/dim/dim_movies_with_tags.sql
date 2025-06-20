{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH movies AS (
    SELECT
        *
    FROM
        {{ ref('dim_movies') }}
)

, tags AS (
    SELECT
        *
    FROM
        {{ ref('dim_genome_tags') }}
)

, scores AS (
    SELECT
        *
    FROM
        {{ ref('fact_genome_scores') }}
)

SELECT
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevance_score

FROM
    movies AS m
LEFT JOIN
    scores AS s
ON m.movie_id = s.movie_id
LEFT JOIN
    tags   AS t
ON t.tag_id = s.tag_id