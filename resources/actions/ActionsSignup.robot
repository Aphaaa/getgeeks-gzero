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
