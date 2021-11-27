with covid_death as (
    select _ROW,
        PROVINCE,
        GROWTH_FACTOR_OF_NEW_DEATHS,
        NEW_DEATHS,
        TOTAL_DEATHS,
        TOTAL_DEATHS_PER_MILLION,
        DATE
        from {{source("GOOGLE_SHEETS","COVID_19_INDONESIA_MAHESH_PRASAD")}}
        where PROVINCE is not null
)
select * from covid_death