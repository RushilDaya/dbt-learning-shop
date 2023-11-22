{% macro get_distinct_as_list(table_name, column_name) %}

{% set query %}
    select distinct {{ column_name }} from {{ ref(table_name) }}
{% endset %}
{% set query_results = run_query(query) %}

{% if execute %}
{# Return the first column #}
{% set values = query_results.columns[0].values() %}
{% else %}
{% set values = [] %}
{% endif %}

{{ return(values) }}

{% endmacro %}
