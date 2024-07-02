Feature: Visualizar métodos de pagamento

Scenario: Visualizar métodos de pagamento quando existem
	Given o usuário com e-mail "iasmin@protonmail.com" está cadastrado no sistema
	And o cartão com cardNumber "5555555555555555" e type "debit" está registrado no seu cadastro
	When uma nova requisição GET é feita com e-mail "iasmin@protonmail.com"
	Then o sistema retorna o cartão com cardNumber "5555555555555555" e type "debit"
	And o código de resposta é "200"
