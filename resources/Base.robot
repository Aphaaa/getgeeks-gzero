*Settings*
Documentation       Base test

#Boa pratica: manter sempre as bibliotecas e Resources em ordem alfabetica
Library             Browser
Library             Collections
Library             factories/Users.py

Resource            actions/ActionsLogin.robot
Resource            actions/ActionsShared.robot
Resource            actions/ActionsSignup.robot

Resource            Database.robot
Resource            Helpers.robot

*Variables*
${BASE_URL}         https://getgeeks-r3.herokuapp.com


*Keywords*
Start Session
    New Browser     chromium        headless=False      slowMo=00:00:00.5
    New Page        ${BASE_URL}


Finish Session
    Take Screenshot