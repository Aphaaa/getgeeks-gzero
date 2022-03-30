*Settings*
Documentation       Database Helpers

Library             DatabaseLibrary
Library             factories/Users.py

* Keywords *
Connect To Postgres

    Connect To Database     psycopg2
    ...                     xwxwnwun
    ...                     xwxwnwun
    ...                     ZbF64O7pHenXBaEGTldpUrsQbEgqCiCQ
    ...                     salt.db.elephantsql.com
    ...                     5432
    

Reset Env

    Execute SQL String      Delete from public.geeks;
    Execute SQL String      Delete from public.users;


Insert User
    [Arguments]             ${user}

    ${hashed_pass}      Get Hashed Pass     ${user}[password]

    ${query}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_pass}', false)

    Execute SQL String      ${query}


Users Seed

    ${user}         Factory User Login
    Insert User     ${user}

    ${user2}         Factory User Be Geek
    Insert User     ${user2}