*Settings*
Documentation       Sessions route

Resource            ${EXECDIR}/resources/Base.robot

*Keywords*
POST Session
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${API_USERS}/sessions
    ...             json=${payload}
    ...             expected_status=any

    [Return]        ${response}