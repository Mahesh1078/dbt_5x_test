with covid_case as (
    select _row,
        PROVINCE,
        TOTAL_CASES_PER_MILLION,
        TOTAL_ACTIVE_CASES,
        NEW_CASES_PER_MILLION,
        CASE_FATALITY_RATE,
        NEW_CASES,
        NEW_ACTIVE_CASES,
        TOTAL_CASES,
        DATE
        from {{source("GOOGLE_SHEETS","COVID_19_INDONESIA_MAHESH_PRASAD")}}
)
select * from covid_case