*Settings*
Documentation       Signup actions

*Keywords*
Go To Signup Form
    Go to       ${BASE_URL}/signup

    Wait For Elements State     css=.signup-form        visible     5

Fill Signup Form
    [Arguments]         ${user}

    Fill text       id=name         ${user}[name]
    Fill text       id=lastname     ${user}[lastname]
    Fill text       id=email        ${user}[email]
    Fill text       id=password     ${user}[password]


Submit Signup Form
    Click           css=.submit-button >> text=Cadastrar

User Should Be Registered

    ${expect_message}       Set Variable        css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State     ${expect_message}       visible     5


Alert Span Should Be
    [Arguments]         ${expect_alert}    
  
    Wait For Elements State     css=span[class=error] >> text=${expect_alert}
    ...                         visible     5


Alert Spans Should Be
    [Arguments]         ${expect_alerts}    

    @{got_alerts}       Create List

    # A palavra chave Get Elements da biblioteca browser que pode coletar mais de um elemento
    ${spans}       Get Elements        xpath=//span[(@class="error")]
  
    # loop coleta e validações de alertas
    FOR     ${span}     IN      @{spans}
        
        ${text}             Get Text            ${span}
        Append To List      ${got_alerts}       ${text}

    END

    Lists Should Be Equal       ${expect_alerts}     ${got_alerts}
