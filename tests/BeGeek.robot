*Settings*
Documentation       Begeek test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       After Test

*Test Cases*
Cenário: Be a Geek
    [Tags]      happy_cadgeek       smoke_test

    # Dado que eu tenho um usuário comum
    ${user}         Factory User        be_geek
    # E faço login na aplicação
    Do Login                ${user}
    # Quando submeto o formulário para me tornar um geek (prestador de serviço)
    Go To Geek Form
    Fill Geek Form          ${user}[geek_profile]
    Submit Geek Form
    # Então devo ver a mensagem de sucesso
    Geek Should Be Registered

