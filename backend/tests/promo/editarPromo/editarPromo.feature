Feature: Editar promoção
    As a administrador do sistema 
    I want to ser capaz de editar promoções
    So that o usuário possa ter acesso a promoções atualizadas   
    
    Scenario: Editar promoção com sucesso
        Given existe uma promoção cadastrada no sistema para o hotel com id: "10"
        When o administrador faz uma requisição PUT para o endpoint "/promo/editar_promocao/10" com desconto: "50", promoName: "Nova Promoção", data_inicio: "2022-01-01", data_fim: "2022-01-31"
        Then o sistema retorna o código de resposta "200"
        Then o sistema retorna a mensagem "Promo edited successfully."
        Then a promoção de id: "10" é atualizada no sistema com desconto: "50", promoName: "Nova Promoção", data_inicio: "2022-01-01", data_fim: "2022-01-31"
    
  