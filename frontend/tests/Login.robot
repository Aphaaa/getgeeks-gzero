*Settings*
Documentation       Login test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       After Test

*Test Cases*
Cenário: User Login
    [Tags]      login_happy     smoke_test

    ${user}     Factory User        login

    # Dado que acesso a página de Login 
    Go To Login Page
    # Quando faço o meu login preenchendo os campos login e Senha
    Fill Credentials                ${user}
    Submit Credentials
    # Então efetuo o login na aplicação
    User Should Be Logged In        ${user}
    
Cenário: Incorrect Pass
    [Tags]      attempt_login       incorrect_pass

    ${user}     Create Dictionary       email=rteste@gmail.com       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.


Cenário: User Not Found
    [Tags]      attempt_login       user_404

    ${user}     Create Dictionary       email=teste404@teste.com       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.


Cenário: Incorrect Email
    [Tags]      attempt_login       incorrect_email

    ${user}     Create Dictionary       email=teste.teste.com       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email

#   Desafio 1 modulo PRO

#Automatizar 3 novos casos de testes: Email obrigatório, Senha obrigatória, e Campos obrigatórios

Cenário: Mandatory Email
    [Tags]      attempt_login       challenge_req_fields       mandatory_email

    ${user}     Create Dictionary       email=${EMPTY}       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be      E-mail obrigatório


Cenário: Mandatory Password

    [Tags]      attempt_login       challenge_req_fields       mandatory_password

    ${user}     Create Dictionary       email=teste@teste.com       password=${EMPTY}

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be      Senha obrigatória


Cenário: Mandatory Login Fields

    [Tags]      attempt_login       challenge_req_fields       mandatory_fields

    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be       ${expected_alerts}