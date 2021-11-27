with covid_recovered as (
    select _row,
        PROVINCE,
        TOTAL_RECOVERED,
        NEW_RECOVERED,
        CASE_RECOVERED_RATE,
        DATE
        from {{source("GOOGLE_SHEETS","COVID_19_INDONESIA_MAHESH_PRASAD")}}
        where PROVINCE is not null
)
select * from covid_recovered