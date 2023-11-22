with
    input as (
        select
            0 as id,
            'This Is A Test'
            as input_col,
            'this is a test'
            as expected_output_col
    ),
    macro_output as (
        select id, {{ to_lowercase("input_col") }} as macro_output_col from input
    )
select *
from input
join macro_output on input.id = macro_output.id
where macro_output.macro_output_col != input.expected_output_col