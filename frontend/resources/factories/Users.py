from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed


def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]


def factory_user(target):

    data = {
        'faker':{
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'Teste123*'
        },
        'wrong_email': {
            'name': 'Pedro',
            'lastname': 'de Lara',
            # lower() é um metodo nativo do python que converte o texto para letras minusculas
            'email': 'pedro_dl&gmail.com',
            'password': 'Teste123*'
        },
        'login': {
            'name': 'Raphael',
            'lastname': 'Teste',
            'email': 'rteste@gmail.com',
            'password': 'Teste123*'
        },
        'be_geek': {
            'name': 'Kin',
            'lastname': 'Dotcom',
            'email': 'kin@dot.com',
            'password': 'Teste123*',
            'geek_profile':{
                'whatsapp': '11999999999',
                'description': 'Faço a formatação do seu Desktop e/ou Notebook, Faço a instalação do sistema operacional Windowns e Linux e tambem a instalação do pacote office.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }
        },
        'attempt_be_geek': {
            'name': 'Dio',
            'lastname': 'Linux',
            'email': 'dio@linux.com',
            'password': 'Teste123*',
            'geek_profile':{
                'whatsapp': '11999999999',
                'description': 'Lorem ipsum sit vehicula tellus aptent lorem non sit, vehicula aliquet vulputate blandit purus nunc pharetra, feugiat arcu mauris ad nostra sapien feugiat. erat quam habitant ac praesent non pulvinar aptent commodo in ut conubia, sagittis ullamcorper frin',
                'printer_repair': 'Não',
                'work': 'Presencial',
                'cost': '100'
            }
        },
        'searcher':{
            'name': 'Johnny',
            'lastname': 'Lawrence',        
            'email': 'johnny@cobrakai.com',
            'password': 'Teste123*'
        },
        'search_alien':{
            'name': 'Doc',
            'lastname': 'Ock',        
            'email': 'doc@oscorp.com',
            'password': 'Teste123*',
            'geek_profile':{
                'whatsapp': '21999991001',
                'desc': 'Faço concerto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinda e tambem impressora 3d.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_common':{
            'name': 'Peter',
            'lastname': 'Parker',            
            'email': 'parker@oscorp.com',
            'password': 'Teste123*',
            'geek_profile':{            
                'whatsapp': '13999991002',
                'desc': 'Faço instalação de distribuidores Linux no seu computador PC X86 ou X64 com processadores Intel ou AMD. Pode ser Linux Debian, Ubuntu, Mint, Fedora, etc...',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '200'
            }
        }
    }

    return data[target]