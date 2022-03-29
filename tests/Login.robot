*Settings*
Documentation       Login test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Cenário: User Login
    [Tags]      login_happy

    ${user}                     Factory User Login

    # Dado que acesso a página de Login 
    Go To Login Page
    # Quando faço o meu login preenchendo os campos login e Senha
    Fill Credentials                ${user}
    Submit Credentials
    # Então efetuo o login na aplicação
    User Should Be Logged In        ${user}
    
Cenário: Incorrect Pass
    [Tags]      incorrect_pass

    ${user}     Create Dictionary       email=rteste@gmail.com       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.


Cenário: User Not Found
    [Tags]      user_404

    ${user}     Create Dictionary       email=teste404@teste.com       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.


Cenário: Incorrect Email
    [Tags]      incorrect_email

    ${user}     Create Dictionary       email=teste.teste.com       password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email