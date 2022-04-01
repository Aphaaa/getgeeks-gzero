*Settings*
Documentation       Atempt begeek test suite

Resource            ${EXECDIR}/resources/Base.robot

Suite Setup          Start Session For Attempt Be a Geek
Test Template       Attempt Be a Geek

*Variables*
${long_desc}        Lorem ipsum sit vehicula tellus aptent lorem non sit, vehicula aliquet vulputate blandit purus nunc pharetra, feugiat arcu mauris ad nostra sapien feugiat. erat quam habitant ac praesent non pulvinar aptent commodo in ut conubia, sagittis ullamcorper frin12345


*Test Cases*
Short desc              description         Formato seu PC      A descrição deve ter no minimo 80 caracteres
Long desc               description         ${EMPTY}            Informe a descrição do seu trabalho
Empty desc              description         ${long_desc}        A descrição deve ter no máximo 255 caracteres
Whatsapp only ddd       whatsapp            11                  O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp only number    whatsapp            999999999           O Whatsapp deve ter 11 digitos contando com o DDD
Empty whatsapp          whatsapp            ${EMPTY}            O Whatsapp deve ter 11 digitos contando com o DDD
Cost letters            cost                ABCD                Valor hora deve ser numérico
Cost alpha              cost                aa12                Valor hora deve ser numérico
Cost special chars      cost                @$#%#¨@             Valor hora deve ser numérico
Empty Cost              cost                ${EMPTY}            Valor hora deve ser numérico
No printer repair       printer_repair      ${EMPTY}            Por favor, informe se você é um Geek Supremo
No work                 work                ${EMPTY}            Por favor, selecione o modelo de trabalho


*Keywords*
Attempt Be a Geek
    [Arguments]     ${key}      ${input_field}      ${output_message}

    ${user}         Factory User       attempt_be_geek

    Set To Dictionary       ${user}[geek_profile]       ${key}      ${input_field} 
    
    Fill Geek Form          ${user}[geek_profile]
    Submit Geek Form
    # Então devo ver a mensagem de sucesso
    Alert Span Should Be        ${output_message}
    Take Screenshot             fullPage=True


Start Session For Attempt Be a Geek
    
    ${user}         Factory User        attempt_be_geek
    
    Start Session
    Do Login                ${user}
    Go To Geek Form