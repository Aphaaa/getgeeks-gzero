#   API Users

Ator: Aplicação Web, Mobile ou qualquer outro front

##  Sessions
	
### Login do Usuário
		
`Dado que o usuário submeteu o formulário de login com dados corretos`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 200`
`E deve retornar um token JWR na resposta`
`E esse token deve expirar em 10 dias`

### Senha Incorreta
		
`Dado que o usuário submeteu o formulário de login com senha inválida`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized" na resposta`

### Usuário não existe
		
`Dado que o usuário submeteu o formulário de login com um e-mail não cadastrado`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 401`
`E deve retornar a mensagem "Unauthorized" na resposta`

### E-mail no formato incorreto
		
`Dado que o usuário submeteu o formulário de login com um e-mail no formato incorreto`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "Incorrect email" na resposta`

### E-mail em branco
		
`Dado que o usuário submeteu o formulário de login com um e-mail em branco`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "required email" na resposta`

### Sem o campo E-mail
		
`Dado que o usuário submeteu o formulário de login sem o campo e-mail`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "required email" na resposta`

### Senha em branco
		
`Dado que o usuário submeteu o formulário de login com um senha em branco`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "required pass" na resposta`

### Sem o campo Senha
		
`Dado que o usuário submeteu o formulário de login sem o campo senha`
`Quando faço uma requisição POST para a rota/Sessions`
`Então o status code deve ser igual a 400`
`E deve retornar a mensagem "required pass" na resposta`