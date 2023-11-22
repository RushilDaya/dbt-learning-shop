
{% macro to_lowercase(column_name) %}
    lower({{ column_name }})
{% endmacro %}
