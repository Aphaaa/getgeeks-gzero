*Settings*
Documentation       Users route

Resource            ${EXECDIR}/resources/Base.robot

*Keywords*
POST User
    [Arguments]     ${payload}
    # Keyword para montagem da requisição de cadastro de usuário
    ${response}     POST
    ...             ${API_USERS}/users
    ...             json=${payload}
    ...             expected_status=any

    [Return]        ${response}


DELETE User
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}
    # Keyword para montagem da requisição de exclusão de usuário
    ${response}     DELETE
    ...             ${API_USERS}/users
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}


GET User
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}
    # Keyword para montagem da requisição de consulta de dados do usuário
    ${response}     GET
    ...             ${API_USERS}/users
    ...             headers=${headers}
    ...             expected_status=any

    [Return]        ${response}


PUT User
    [Arguments]     ${token}        ${payload}

    ${headers}      Create Dictionary       Authorization=${token}

    # Keyword para montagem da requisição de cadastro de usuário
    ${response}     PUT
    ...             ${API_USERS}/users
    ...             json=${payload}
    ...             headers=${headers}    
    ...             expected_status=any

    [Return]        ${response}