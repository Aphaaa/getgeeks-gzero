*Settings*
Documentation       Geek route

Resource            ${EXECDIR}/resources/Base.robot

*Keywords*
POST Geek
    [Arguments]     ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=${token}

    # Keyword para montagem da requisição de cadastro de usuário
    ${response}     POST
    ...             ${API_Geeks}/geeks
    ...             json=${payload}
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}


GET Geeks
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}

    # Keyword para montagem da requisição de cadastro de usuário
    ${response}     GET
    ...             ${API_Geeks}/geeks
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}