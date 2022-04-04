*Settings*
Documentation       Sessions route test suite

Resource            ${EXECDIR}/resources/Base.robot

* Variable *
&{incorret_pass}        email=kate@hotmail.com       password=abc123*
&{incorret_email}       email=kate#hotmail.com       password=Teste123*
&{email_404}            email=kate@404.com           password=Teste123*
&{empty_email}          email=${EMPTY}               password=Teste123*
&{wo_email}             password=Teste123*
&{empty_pass}           email=kate@hotmail.com       password=${EMPTY}
&{wo_pass}              email=kate@hotmail.com


*Test Cases*
Cenário: Login do Usuário

    ${payload}      Factory User Session      signup
    POST User       ${payload}


    ${payload}      Factory User Session      login

    ${response}     POST Session            ${payload}

    Status Should Be        200                     ${response}
    
    ${size}                 Get Length              ${response.json()}[token]
    ${expected_size}        Convert To Integer      140
    
    Should Be Equal         ${expected_size}        ${size}
    Should Be Equal         10d                     ${response.json()}[expires_in]

Should Not Get Token
    [Template]              Attempt POST Session 
    
    ${incorret_pass}        401         Unauthorized
    ${incorret_email}       400         Incorrect email
    ${email_404}            401         Unauthorized
    ${empty_email}          400         Required email
    ${wo_email}             400         Required email
    ${empty_pass}           400         Required pass
    ${wo_pass}              400         Required pass


*Keywords*
Attempt POST Session
    [Arguments]     ${payload}      ${status_code}      ${error_message}

    ${response}     POST Session            ${payload}

    Status Should Be        ${status_code}          ${response}
    Should Be Equal         ${error_message}        ${response.json()}[error]