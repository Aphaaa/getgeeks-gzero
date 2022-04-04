*Settings*
Documentation       Shared actions

*Keywords*
Modal Content Should Be
    [Arguments]         ${expect_message}

    ${title}          Set Variable        css=.swal2-title
    ${content}        Set Variable        css=.swal2-html-container

    Wait For Elements State     ${title}        visible     5
    Get Text                    ${title}        Equal       Oops...
    
    Wait For Elements State     ${content}       visible     5
    Get Text                    ${content}       Equal       ${expect_message}


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