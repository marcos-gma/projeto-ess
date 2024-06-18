Feature: Cadastro de Promoção

    Scenario: Cadastro com sucesso de nova promoção
        Given o administrador João que deseja cadastrar uma nova promoção
        Given uma acomodação com id: "2" está cadastrada no sistema
        When o administrador preenche os dados id: 2, desconto: 50, promoName: "Promoção metade", data_inicio: "2021-10-01", data_fim: "2021-10-31" e confirma
        Then o sistema confirma a requisição
        Then o sistema retorna a mensagem "Promo created successfully."
        Then a acomodação "Apartamento Central" possui desconto de 50%, promoName "Promoção metade", data_inicio "2021-10-01", data_fim "2021-10-31"
