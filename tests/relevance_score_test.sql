SELECT
    movie_id,
    tag_id,
    relevance_score

FROM
    {{ ref('fact_genome_scores') }}

WHERE
    relevance_score <=0