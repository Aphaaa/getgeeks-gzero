*Settings*
Documentation       Signup Required Test Suite

Resource            ${EXECDIR}/resources/Base.robot
Resource            ${EXECDIR}/resources/Helpers.robot

Suite Setup         Signup Without Fill Form
Test Teardown       Finish Session


*Test Cases*
Cenário: Name is required
    Alert Span Should Be        Cadê o seu nome?

Cenário: Lastname is required
    Alert Span Should Be        E o sobrenome?

Cenário: Email is required
    Alert Span Should Be        O email é importante também!

Cenário: Password is required
    Alert Span Should Be        Agora só falta a senha!


* Keywords *
Signup Without Fill Form

    Start Session
    # Dado que acesso a página de cadastro 
    Go To Signup Form
    # Dado que acesso a página de cadastro 
    Submit Signup Form