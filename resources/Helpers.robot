*Settings*
Documentation       Test Helpers (serve para agrupar steps)

*Keywords*
Add User From Database
    [Arguments]     ${user}

    Connect To Postgres
    Insert User     ${user}
    Disconnect From Database


    #Exemplo de agrupamento de steps do CT01
        ## Ações para cadastro de usuários
        #Go To Signup Form
        #Fill Signup Form        ${user}
        #Submit Signup Form
        #User Should Be Registered
