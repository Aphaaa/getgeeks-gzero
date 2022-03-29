from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed


def factory_user():
    user = {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'Teste123*'
    }

    return user


def factory_wrong_email():

    first_name = fake.first_name()

    return {
        'name': first_name,
        'lastname': fake.last_name(),
        # lower() é um metodo nativo do python que converte o texto para letras minusculas
        'email': first_name.lower() + '&gmail.com',
        'password': 'Teste123*'
    }


def factory_user_login():

    return {
        'name': 'Raphael',
        'lastname': 'Teste',
        'email': 'rteste@gmail.com',
        'password': 'Teste123*'
    }

