with location as
(select _row as ROW_SEQ,
        PROVINCE,
        country,
        "POPULATION",
        DATE
     from {{ ref('location') }}
     where LOCATION_LEVEL='Province'),

 covid_case as 
    (select * from {{ ref('covid_case') }}),

 covid_death as 
    (select *
    from {{ ref('covid_death') }}),

covid_recovered as 
    (select * from {{ ref('covid_recovered') }}),

covid_case as 
    (select * from {{ ref('covid_case') }})

select loc.*,de.GROWTH_FACTOR_OF_NEW_DEATHS,
        de.NEW_DEATHS,
        de.TOTAL_DEATHS,
        de.TOTAL_DEATHS_PER_MILLION,
        re.TOTAL_RECOVERED,
        re.NEW_RECOVERED,
        re.CASE_RECOVERED_RATE,
        ca.TOTAL_CASES_PER_MILLION,
        ca.TOTAL_ACTIVE_CASES,
        ca.NEW_CASES_PER_MILLION,
        ca.CASE_FATALITY_RATE,
        ca.NEW_CASES,
        ca.NEW_ACTIVE_CASES,
        ca.TOTAL_CASES
 from location loc left outer join covid_case ca on(loc.PROVINCE=ca.PROVINCE 
                                                        and TO_DATE(loc.DATE)=TO_DATE(CA.DATE))
                    left outer join COVID_DEATH de on(loc.PROVINCE=de.PROVINCE 
                                                and TO_DATE(loc.DATE)=TO_DATE(de.DATE))
                    left outer join COVID_RECOVERED re on(loc.PROVINCE=re.PROVINCE 
                                                and TO_DATE(loc.DATE)=TO_DATE(re.DATE))