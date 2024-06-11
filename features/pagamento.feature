Feature: Cadastro e manutenção de métodos de pagamento
As a cliente
I want to visualizar, adicionar, remover e selecionar meus métodos de pagamento
So that eu consiga gerenciar meus métodos de pagamento e realizar reservas



GUI:

Scenario: Visualizar métodos de pagamento
	Given eu estou na página de “Reserva”
	When eu seleciono a opção “Métodos de pagamento”
	Then eu visualizo a lista de métodos de pagamento registrados

Scenario: Adicionar novo método de pagamento com sucesso
	Given eu estou na página de “Métodos de Pagamento”
	And eu não vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento registrados
	When eu seleciono a opção “Adicionar”
	Then eu estou na página de "Adicionar Método de Pagamento" 
    When eu preencho os campos:
	{ 
		card_number: “5555 5555 5555 5555”, 
		name: “Iasmin Gomes”, 
		expire_date: “06/2100”,
		type: “debit”,
		cvv: “123”
	}
	And eu seleciono a opção “Salvar”
	Then eu estou na página de “Métodos de Pagamento”
    And eu vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento registrados

Scenario: Adicionar novo método de pagamento sem sucesso
	Given eu estou na página de “Métodos de Pagamento”
	And eu não vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento registrados
	When eu seleciono a opção “Adicionar” 
    Then eu estou na página de "Adicionar Método de Pagamento" 
    When eu preencho os campos:
	{ 
		card_number: “5555 5555 5555 5555”, 
		name: “Iasmin Gomes”, 
		expire_date: “06/2100”,
		type: “debit”,
		cvv: “”
	}
	And eu seleciono a opção “Salvar”
	Then eu vejo a mensagem de erro “Dados inválidos”
    And eu estou na página de “Métodos de Pagamento” 
    And eu não vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento registrados

Scenario: Remover método de pagamento
	Given eu estou na página de “Métodos de Pagamento”
	And eu vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento registrados
	When eu seleciono a opção “Remover”
	Then eu estou na página de “Métodos de Pagamento”
	And eu não vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento

Scenario: Selecionar método de pagamento
	Given eu estou na página de “Métodos de Pagamento”
	And eu vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” na lista de métodos de pagamento registrados
	When eu seleciono a opção “Selecionar”
	Then eu estou na página de "Confirmação de Reserva"
	And eu vejo o cartão com card_number “5555 5555 5555 5555” e type “debit” como método de pagamento escolhido



SERVICE:

Scenario: Visualizar métodos de pagamento quando existem
	Given o usuário com e-mail “iasmin@protonmail.com” está cadastrado no sistema
	And o cartão com card_number “5555 5555 5555 5555” e type “debit” está registrado no seu cadastro
	When uma nova requisição GET é feita para o endpoint “/metodos_de_pagamento”
	Then o sistema retorna o cartão com card_number “5555 5555 5555 5555” e type “debit”
	And o código de resposta é "200"

Scenario: Visualizar métodos de pagamento quando não existem
	Given o usuário com e-mail “iasmin@protonmail.com” está cadastrado no sistema
	And não há cartão registrado no seu cadastro
	When uma nova requisição GET é feita para o endpoint “/metodos_de_pagamento”
	Then o sistema retorna uma lista vazia 
	And o código de resposta é “200”

Scenario: Adicionar novo método de pagamento com sucesso
	Given o usuário com e-mail “iasmin@protonmail.com” está cadastrado no sistema
	And não há o cartão com card_number “5555 5555 5555 5555” e type “debit” registrado no seu cadastro
	When uma nova requisição POST é feita para o endpoint “/metodos_de_pagamento” com o body: 
	{ 
		e-mail: "iasmin@protonmail.com", 
		card_number: “5555 5555 5555 5555”, 
		name: “Iasmin Gomes”, 
		expire_date: “06/2100”, 
		type: “debit”,
		cvv: “123”
	}	
	Then o cartão com card_number “5555 5555 5555 5555” e type “debit” é registrado no seu cadastro
	And o código de resposta é “201”

Scenario: Adicionar novo método de pagamento sem sucesso
	Given o usuário com e-mail “iasmin@protonmail.com” está cadastrado no sistema
	And não há o cartão com card_number “5555 5555 5555 5555” e type “debit” registrado no seu cadastro
	When uma nova requisição POST é feita para o endpoint “/metodos_de_pagamento” com o body:
	{
		e-mail: "iasmin@protonmail.com",
		card_number: “5555 5555 5555 5555”, 
		name: “Iasmin Gomes”, 
		expire_date: “06/2100”, 
		type: “debit”, 
		cvv: “”
	}	
	Then o cartão com card_number “5555 5555 5555 5555” e type “debit” não é registrado no seu cadastro
    And o código de resposta é “400”

Scenario: Remover método de pagamento
	Given o usuário com e-mail “iasmin@protonmail.com” está cadastrado no sistema
	And o cartão com card_number “5555 5555 5555 5555” e type “debit” está registrado no seu cadastro
	When uma nova requisição DELETE é feita para o endpoint “\metodos_de_pagamento” com o body:
	{
		e-mail: "iasmin@protonmail.com",
		card_number: "5555 5555 5555 5555",
		type: "debit"
	}
	Then o cartão é removido do seu cadastro
	And o código de resposta é “204”

Scenario: Selecionar método de pagamento
	Given o usuário com e-mail “iasmin@protonmail.com” está cadastrado no sistema
	And o cartão com card_number “5555 5555 5555 5555” e type “debit” está registrado no seu cadastro
	When uma nova requisição PUT é feita para o endpoint "\metodos_de_pagamento” com o body:
	{
		e-mail: "iasmin@protonmail.com",
		card_number: “5555 5555 5555 5555”,
		type: “debit”
	}
	Then o cartão com card_number “5555 5555 5555 5555” e type “debit” se torna o método de pagamento escolhido
	And o código de resposta é "200"
	