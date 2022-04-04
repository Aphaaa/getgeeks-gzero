*Settings*
Documentation       Users route test suite

Resource            ${EXECDIR}/resources/Base.robot


*Test Cases*
Add new user
    # Armazena os dados do usuário na variavel User
    ${user}      Factory New User
    # Remove o usuário da base de dados para evitar o cadastro de um usuário que ja faz parte da base de dados
    Remove User     ${user}
    # Criação de Usuário
    ${response}             POST User           ${user}
    # Verifica o statuscode da criação de usuário
    Status Should Be        201                 ${response}
    # Validação de ID do usuário criado
    ${user_id}              Set Variable        ${response.json()}[id]
    Should Be True          ${user_id} > 0


Get user data
    # Armazena os dados do usuário na variavel User 
    ${user}     Factory Get User
    # Remove o usuário da base de dados para evitar o cadastro de um usuário que ja faz parte da base de dados
    Remove User             ${user}
    # Criação de Usuário    
    POST User               ${user}
    # Armaneza na variavel o token do usuário
    ${token}                Get Token           ${user}
    # Coleta os dados do usuário cadastrado
    ${response}             GET User            ${token}
    # Verifica o statuscode da consulta do usuário
    Status Should Be        200                 ${response}

    # Validações para verificação dos dados do usuário retornado na requisição de consulta
    Should Be Equal As Strings      ${user}[name]       ${response.json()}[name]
    Should Be Equal As Strings      ${user}[email]      ${response.json()}[email]
    Should Be Equal As Strings      None                ${response.json()}[whatsapp]
    Should Be Equal As Strings      None                ${response.json()}[avatar]
    Should Be Equal As Strings      False               ${response.json()}[is_geek]

   
Remove user
## DADO QUE EXISTE UM USUÁRIO NO SISTEMA
    # Armazena os dados do usuário na variavel User 
    ${user}                 Factory Remove User
    # Criação de Usuário    
    POST User               ${user}

## E TENHO O TOKEN DESTE USUÁRIO    
    # Armaneza na variavel o token do usuário
    ${token}                Get Token           ${user}

##  QUANDO FAÇO A SOLICITAÇÃO DE REMOÇÃO NA ROTA /USERS
    # Coleta os dados da requisição de exclusão do usuário cadastrado
    ${response}             DELETE User         ${token}

##  ENTÃO DEVE RETORNAR O STATUS CODE 204 (NO CONTENT)
    # Verifica o statuscode da requisição de DELETE
    Status Should Be        204                 ${response}

## E AO FAZER UMA REQUISIÇÃO GET NA ROTA /USERS, DEVE RETORNAR O STATUS CODE 404 (NOT FOUND)
    ${response}             GET User            ${token}
    Status Should Be        404                 ${response}


Update a user
## DADO QUE EXISTE UM USUÁRIO NO SISTEMA
    # Armazena os dados do usuário na variavel User 
    ${user}         Factory Update User
    # Criação de Usuário    
    POST User       ${user}[before]

## E TENHO O TOKEN DESTE USUÁRIO    
    # Armaneza na variavel o token do usuário
    ${token}        Get Token       ${user}[before]

##  QUANDO FAÇO A SOLICITAÇÃO DE ATUALIZAÇÃO NA ROTA /USERS
    # Coleta os dados da requisição de atualização de cadastro do usuário
    ${response}     PUT User        ${token}       ${user}[after]

##  ENTÃO DEVE RETORNAR O STATUS CODE 200
    # Verifica o statuscode da requisição de atualização do cadastro do usuário
    Status Should Be        200     ${response}

##  ENTÃO CONSULTA SE OS DADOS DO USUÁRIO FORAM EXCLUIDOS DO SISTEMA
    # Coleta os dados do usuário cadastrado
    ${response}     GET User        ${token}

    # Validações para verificação dos dados do usuário retornado na requisição de consulta
    Should Be Equal As Strings      ${user}[after][name]        ${response.json()}[name]
    Should Be Equal As Strings      ${user}[after][email]       ${response.json()}[email]
    Should Be Equal As Strings      ${user}[after][whatsapp]    ${response.json()}[whatsapp]
    Should Be Equal As Strings      ${user}[after][avatar]      ${response.json()}[avatar]
    Should Be Equal As Strings      False                       ${response.json()}[is_geek]