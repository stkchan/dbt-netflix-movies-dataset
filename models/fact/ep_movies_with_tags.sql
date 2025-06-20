WITH fct_movies_with_tags AS (
    SELECT
        *
    FROM
        {{ ref('dim_movies_with_tags') }}
)

SELECT
    *
FROM
    fct_movies_with_tags