*Settings*
Documentation       Geek route test suite

Resource            ${EXECDIR}/resources/Base.robot

*Test Cases*
Be a geek
    [Tags]      cad_geek    

    ##  Dado que temso um usuário novo
        ${user}      Factory Be Geek
        # Remove o usuário da base de dados para evitar o cadastro de um usuário que ja faz parte da base de dados
        Remove User     ${user}

    ##  E esse usuário é um cliente comum
        # Criação de Usuário de um cliente comum
        POST User       ${user}

    ##  E esse usuário possui um token válido
        ${token}                Get Token       ${user}

    ##  Quando faço uma requisição POST na rota /geeks
        ${response}             POST Geek       ${token}        ${user}[geek_profile]

    ##  Então deve retornar status code 201
        # Verifica o statuscode da criação de usuário
        Status Should Be        201             ${response}

    ##  E ao consultar esse usuário na API Users
        ${response}             GET User        ${token}

    ##  Então o perfil geek deve ser retornado
        # Validações para verificação dos dados do usuário retornado na requisição de consulta
        Should Be Equal As Strings      ${user}[name]                           ${response.json()}[name]
        Should Be Equal As Strings      ${user}[email]                          ${response.json()}[email]
        Should Be Equal As Strings      ${user}[geek_profile][whatsapp]         ${response.json()}[whatsapp]
        Should Be Equal As Strings      ${user}[geek_profile][desc]             ${response.json()}[desc]

        # Converte os dados de Cost do usuário e o retornado da requisição em numérico 
        ${expected_float}               Convert To Number                       ${response.json()}[cost]
        ${got_float}                    Convert To Number                       ${user}[geek_profile][cost]
        Should Be Equal                 ${expected_float}                       ${got_float}

        Should Be Equal As Strings      ${user}[geek_profile][printer_repair]   ${response.json()}[printer_repair]
        Should Be Equal As Strings      ${user}[geek_profile][work]             ${response.json()}[work]
        Should Be Equal As Strings      None                                    ${response.json()}[avatar]
        Should Be Equal As Strings      True                                    ${response.json()}[is_geek]

Get Geek List
    [Tags]       geek_list

    ${data}      Factory Search For Geeks

    # Cadastro da lista de Geeks do sistema
    FOR     ${geek}     IN      @{data}[geeks]
        # Criação de Usuário de um cliente comum
        POST User       ${geek}

        # Armazena o token do usuário
        ${token}        Get Token       ${geek}

        # Requisição POST na rota /geeks para adicionar usuário geek no sistema
        POST Geek       ${token}        ${geek}[geek_profile]

    END

    ##  E esse usuário é um cliente comum
        # Criação de Usuário de um cliente comum
        POST User       ${data}[user]

    ##  E esse usuário possui um token válido
        ${token}        Get Token       ${data}[user]

    ##  Quando faço uma requisição GET na rota /geeks
        ${response}     GET Geeks       ${token}

    ##  Então deve retornar status code 201
        # Verifica o statuscode consulta de usuários Geeks
        Status Should Be        200     ${response}

    ##  E valida se a lista retorna numero maior que 0
        ${total}        Get Length      ${response.json()}[Geeks]
        Should Be True      ${total} > 0
        
