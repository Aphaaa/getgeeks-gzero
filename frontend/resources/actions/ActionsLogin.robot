*Settings*
Documentation       Autentica actions

*Variables*
${INPUT_EMAIL}          id=email
${INPUT_PASSWORD}       id=password

*Keywords*
Go To Login Page
    Go to       ${BASE_URL}

    Wait For Elements State     css=.login-form
    #Wait For Elements State     xpath=//h1[contains(text(), "Fazer login")]        
    ...                         visible     5


Fill Credentials
    [Arguments]         ${user}

    Fill text       ${INPUT_EMAIL}        ${user}[email]
    Fill text       ${INPUT_PASSWORD}     ${user}[password]


Submit Credentials
    Click           css=.submit-button >> text=Entrar


User Should Be Logged In
    [Arguments]         ${user}

    #${content}              Set Variable        xpath=//h1[contains(text(), "O que deseja fazer?")]
    ${element}              Set Variable        css=a[href="/profile"]
    ${expected_fullname}    Set Variable        ${user}[name] ${user}[lastname]
    #${title}                Set Variable        xpath=//span[contains(text(), "Seja bem-vindo.")]
    
    Wait For Elements State     ${element}          visible     5
    Get Text                    ${element}          Equal       ${expected_fullname}

    #Wait For Elements State     ${title}         visible     5
    #Get Text                    ${title}         Equal       Seja bem-vindo.

    #Wait For Elements State     ${content}       visible     5
    #Get Text                    ${content}       Equal       O que deseja fazer?


Should Be Type Email
    Get Property     ${INPUT_EMAIL}        type        equal       email


