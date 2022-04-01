*Settings*
Documentation       Base test

#Boa pratica: manter sempre as bibliotecas e Resources em ordem alfabetica
Library             Browser
Library             Collections
Library             factories/Users.py

Resource            actions/ActionsBeGeek.robot
Resource            actions/ActionsLogin.robot
Resource            actions/ActionsShared.robot
Resource            actions/ActionsSignup.robot

Resource            Database.robot
Resource            Helpers.robot

*Variables*
${BASE_URL}         https://getgeeks-r3.herokuapp.com


*Keywords*
Start Session
    New Browser             ${BROWSER}      ${HEADLESS    slowMo=00:00:00
    New Page                ${BASE_URL}
    Set View Port Size      1280            768


Finish Session
    Take Screenshot         fullPage=True