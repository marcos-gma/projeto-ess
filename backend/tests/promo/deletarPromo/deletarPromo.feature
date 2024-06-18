Feature: Deletar promoção
    As a administrador do sistema 
    I want to ser capaz de deletar promoções
    So that o usuário não possa mais visualizá-las
    
    Scenario: Excluir promoção com sucesso
        Given existem promoções cadastradas no endpoint "/promocoes_cadastradas"
        When "Iasmin" faz uma requisição DELETE para o endpoint "/promocoes_cadastradas/3" # (ID da promoção)
        Then o sistema retorna o código de resposta 
        And o sistema retorna a mensagem "Promo deleted successfully."

    