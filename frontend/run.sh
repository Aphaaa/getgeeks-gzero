###########################################################################################
####          Linha de comando para execução delorean (limpa a base de testes)         ####
###########################################################################################
robot -l NONE -o NONE -r NONE tasks/Delorean.robot

###########################################################################################
####       Linha de comando para execução de cenários de testes baseados em Tags       ####
###########################################################################################
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -i required_fields tests/Signup.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -i incorrect_pass -i user_404 tests/Login.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -i mandatory_fields tests/Login.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -i empty_whats tests/BeGeek.robot



###########################################################################################
####    Linha de comando para execução de todos os cenários de testes de um arquivo    ####
###########################################################################################
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests/Signup.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests/Login.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests/BeGeek.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests/AttemptBeGeek.robot
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests/SearchForGeeks.robot

#pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:False tests/SearchForGeeks.robot

###########################################################################################
####          Linha de comando para execução da bateria de Smoke tests                 ####
###########################################################################################
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -i smoke_test tests
#pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -e smoke_test tests
#pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True -i smoke_test tests

###########################################################################################
####          Linha de comando para execução da bateria de testes regressivos           ####
###########################################################################################
#robot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:False tests/
pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:True tests/



###########################################################################################
####        Linha de comando utilização da estrutura de evidencias para PABOT          ####
###########################################################################################
rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot

