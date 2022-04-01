###########################################################################################
####          Linha de comando para execução delorean (limpa a base de testes)         ####
robot -l NONE -o NONE -r NONE tasks/delorean.robot

###########################################################################################
####       Linha de comando para execução de cenários de testes baseados em Tags       ####
###########################################################################################
#robot -d ./logs -i required_fields tests/Signup.robot
#robot -d ./logs -i incorrect_pass -i user_404 tests/Login.robot
#robot -d ./logs -i mandatory_fields tests/Login.robot
#robot -d ./logs -i empty_whats tests/BeGeek.robot



###########################################################################################
####    Linha de comando para execução de todos os cenários de testes de um arquivo    ####
###########################################################################################
#robot -d ./logs tests/Signup.robot
#robot -d ./logs tests/Login.robot
#robot -d ./logs tests/BeGeek.robot
robot -d ./logs tests/AttemptBeGeek.robot


###########################################################################################
####          Linha de comando para execução da bateria de Smoke tests                 ####
###########################################################################################
#robot -d ./logs -i smoke_test tests


###########################################################################################
####          Linha de comando para execução da bateria de tstes regressivos           ####
###########################################################################################
#robot -d ./logs tests/

