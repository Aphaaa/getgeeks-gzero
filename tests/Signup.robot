*Settings*
Documentation       Signup Test Suite

Resource            ${EXECDIR}/resources/Base.robot
Resource            ${EXECDIR}/resources/Helpers.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Cenário: Cadastro de cliente
    [Tags]      cad_happy       smoke_test

    ${user}     Factory User        faker

    # Dado que acesso a página de cadastro 
    Go To Signup Form
    # Quando faço o meu cadastro com o nome completo, e-mail e senha
    Fill Signup Form        ${user}
    Submit Signup Form
    # Então vejo a mensagem de boas vindas
    User Should Be Registered


Cenário: E-mail duplicado
    [Tags]      attempt_signup      duplicate_email

    ${user}     Factory User        faker

    Add User From Database  ${user}

    # Dado que acesso a página de cadastro 
    Go To Signup Form
    # Quando faço o meu cadastro com o nome completo, e-mail e senha
    Fill Signup Form        ${user}
    Submit Signup Form
    # Então vejo a mensagem de alerta
    Modal Content Should Be         Já temos um usuário com o e-mail informado.


Cenário: Email com formato incorreto
    [Tags]      attempt_signup      wrong_email

    ${user}     Factory User        wrong_email

    # Dado que acesso a página de cadastro 
    Go To Signup Form
    # Quando faço o meu cadastro com o Email com formato incorreto
    Fill Signup Form        ${user}
    Submit Signup Form
    # Então vejo a mensagem de alerta "O email está estranho"
    Alert Span Should Be      O email está estranho


Cenário: Campos obrigatórios
    [Tags]      attempt_signup      required_fields
    
    @{expected_alerts}      Create List
    ...                     Cadê o seu nome?
    ...                     E o sobrenome?
    ...                     O email é importante também!
    ...                     Agora só falta a senha!

    # Dado que acesso a página de cadastro 
    Go To Signup Form
    # Quando submeto o cadastro sem preencher o formulário
    Submit Signup Form
    # Então devo ver uma mensagem informando que todos os campos são obrigatórios
    Alert Spans Should Be       ${expected_alerts}


Cenário: Senha muito curta
    [Tags]          attempt_signup      short_password
    [Template]      Signup With Short Password

    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    ab3c
    a23bc
    -1
    acb#1


* Keywords *
Signup With Short Password
    [Arguments]         ${short_pass}

    ${user}     Create Dictionary
    ...         name=Raphael        lastname=Reis
    ...         email=rt@msn.com    password=${short_pass}

    # Dado que acesso a página de cadastro 
    Go To Signup Form
    # Quando faço o meu cadastro com senha curta
    Fill Signup Form        ${user}
    Submit Signup Form
    # Então vejo a mensagem de alerta "Informe uma senha com pelo menos 6 caracteres"
    Alert Span Should Be      Informe uma senha com pelo menos 6 caracteres
