*Settings*
Documentation       Search for Geeks test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       After Test

*Test Cases*
Cenário: Search for Alien Geek

    ${alien}        Factory User        search_alien
    Create Geek Profile Service         ${alien}

    ${searcher}     Factory User        searcher
    Do Login        ${searcher}

    Go To Search Geeks
    Fill Search Form        Sim             Matricial a fita colorida
    #Fill Search Form        Não             Locação de computadores
    #Fill Search Form        ${EMPTY}        Impressora 3d
    Submit Search Form

    Geek Should Be Found    ${alien} 
    Alien Icon Should Be visible


Cenário: Search for Common Geek

    ${common}        Factory User        search_common
    Create Geek Profile Service         ${common}

    ${searcher}     Factory User        searcher
    Do Login        ${searcher}

    Go To Search Geeks
    Fill Search Form        Não         PC X86 ou X64
    Submit Search Form

    Geek Should Be Found    ${common}


Cenário: Search not Found
    
    ${searcher}     Factory User        searcher
    Do Login        ${searcher}

    Go To Search Geeks
    Fill Search Form        Não         Conserto Game Atari da Polivox
    Submit Search Form
    Geek Not Found
    
