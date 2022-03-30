* Settings *

Documentation           Geek actions




*Keywords*
Submit Be a Geek
    Click       css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State     css=.be-geek-form      visible     5


Fill Geek Form
    [Arguments]     ${geek_profile}

    Fill Text               id=whatsapp                         ${geek_profile}[whatsapp]
    Fill Text               id=desc                             ${geek_profile}[description]
    Select Options By       id=printer_repair       value       ${geek_profile}[printer_repair]
    Select Options By       id=work                 text        ${geek_profile}[work]
    Fill Text               id=cost                             ${geek_profile}[cost]

        
Submit Geek Form
    Click       css=button >> text=Quero ser um Geek


Geek Should Be Registered
    
    ${expect_message}       Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${expect_message}       visible     5
    