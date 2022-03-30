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


Do Login
    [Arguments]     ${user}

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    User Should Be Logged In        ${user}