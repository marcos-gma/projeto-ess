Feature: Adicionar método de pagamento


Scenario: Adicionar novo método de pagamento com sucesso
	Given o usuário com e-mail "iasmin@protonmail.com" está cadastrado no sistema
	And não há o cartão com cardNumber "5555555555555555" e type "debit" registrado no seu cadastro
	When uma nova requisição POST é feita para o endpoint "/payment-methods/add" com email: "iasmin@protonmail.com", cardNumber: "5555555555555555", name: "Iasmin Gomes", expireDate: "01/06/2100", type: "debit" e cvv: "123"
	Then o cartão com cardNumber "5555555555555555" e type "debit" é registrado no seu cadastro
	And o código de resposta é "201"
