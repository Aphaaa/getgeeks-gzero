*Settings*
Documentation       Begeek test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Cenário: Be a Geek
    [Tags]      happy

    # Dado que eu tenho um usuário comum
    ${user}         Factory User Be Geek
    
    # E faço login na aplicação
    Do Login                ${user}

    # Quando submeto o formulário para me tornar um geek (prestador de serviço)
    Submit Be a Geek
    Fill Geek Form          ${user}[geek_profile]
    Submit Geek Form

    # Então devo ver a mensagem de sucesso
    Geek Should Be Registered


