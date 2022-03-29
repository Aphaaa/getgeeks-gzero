*Settings*
Documentation       Temp

Library            Collections

#Test Setup          Start Session
#Test Teardown       Finish Session

*Test Cases*
Trabalhando com listas

    #Exemplo de lists 01
    @{avangers}     Create List     Tony Stark      Kamalakhan      Steve Rogers

    # Inseri outro valor na Lista
    Append To List     ${avangers}       Bruce Banner
    Append To List     ${avangers}       Scot Lang

    ##Solução 01 - Imprimir valores da lista
    #Log To Console    ${avangers}[0]
    #Log To Console    ${avangers}[1]
    #Log To Console    ${avangers}[2]
    #Log To Console    ${avangers}[3]

    #Solução 02 - Imprimir valores da lista
    FOR     ${a}    IN      @{avangers}
        Log To Console    ${a}
    END

    #Exemplo de lists 02
    @{avangers2}    Create List     
    ...             Tony Stark
    ...             Miss Marvel
    ...             Steve Rogers
    ...             Bruce Banner
    ...             Scot Lang

    #Inserindo validação para comparação das duas listas (${avangers} e ${avangers2})
    Lists Should Be Equal   ${avangers}     ${avangers2}