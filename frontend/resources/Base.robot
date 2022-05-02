*Settings*
Documentation       Base test

#Boa pratica: manter sempre as bibliotecas e Resources em ordem alfabetica
Library             Browser
Library             Collections
Library             String

Library             factories/Users.py
Library             Utils.py


Resource            actions/ActionsBeGeek.robot
Resource            actions/ActionsLogin.robot
Resource            actions/ActionsShared.robot
Resource            actions/ActionsSignup.robot

Resource            Database.robot
Resource            Helpers.robot
Resource            Services.robot

*Variables*
${BASE_URL}         https://getgeeks-r3.herokuapp.com


*Keywords*
Start Session
    New Browser             ${BROWSER}      ${HEADLESS}    slowMo=00:00:00
    New Page                ${BASE_URL}
    Set View Port Size      1280            768


After Test
    ${shot_name}            Screenshot Name
    Take Screenshot         fullPage=True       filename=${shot_name}