Feature: Cadastro e Manutenção de promoções (criar, deletar e editar)
    As a usuário do site
    I want to ser capaz de criar, deletar e editar promoções
    So that eu possa disponibilizar promoções para outros usuários

# Cadastro de promoção
Scenario: Cadastrar uma promoção com sucesso
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Cadastrar Promoção"
    Then O modal de cadastro de promoção é aberto 
    And Eu preencho o campo ID do Hotel com "10", 
                    o campo Desconto com "10", 
                    o campo Nome da Promoção com "Promoção de Natal", 
                    o campo Data de Início com "01/12/2024", 
                    o campo Data de Fim com "25/12/2024"
    And Eu clico no botão "Salvar e Cadastrar"
    Then Eu vejo a mensagem "Promoção cadastrada com sucesso!"
    Then O modal de cadastro de promoção é fechado
    Then Eu vejo a promoção "Promoção de Natal" na página "/my-promos" 
    

Scenario: Cadastrar uma promoção sem sucesso por erro no campo de data
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Cadastrar Promoção"
    Then O modal de cadastro de promoção é aberto 
    And Eu preencho o campo ID do Hotel com "10", 
                    o campo Desconto com "10", 
                    o campo Nome da Promoção com "Promoção de Natal", 
                    o campo Data de Início com "25/12/2024", 
                    o campo Data de Fim com "01/12/2024"
    And Eu clico no botão "Salvar e Cadastrar"
    Then Eu vejo a mensagem "Datas Inválidas: A data de fim deve ser posterior a data de início."
    Then Eu clico no botão "Ok"
    Then Eu não vejo a promoção "Promoção de Natal" na página "/my-promos"

Scenario: Cadastrar uma promoção sem sucesso por erro no campo de desconto
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Cadastrar Promoção"
    Then O modal de cadastro de promoção é aberto 
    And Eu preencho o campo ID do Hotel com "10", 
                    o campo Desconto com "150", 
                    o campo Nome da Promoção com "Promoção de Ano Novo", 
                    o campo Data de Início com "01/12/2024", 
                    o campo Data de Fim com "03/01/2025"
    And Eu clico no botão "Salvar e Cadastrar"
    Then Eu vejo a mensagem "Desconto Inválido: O percentual de desconto deve ser um número entre 1 e 100."
    Then Eu não vejo a promoção "Promoção de Natal" na página "/my-promos"


# Deletar promoção
Scenario: Deletar uma promoção com sucesso
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Deletar" da promoção "Promoção de Ano Novo"
    Then Eu vejo a mensagem "Promoção deletada com sucesso!"
    Then Eu não vejo a promoção "Promoção de Ano Novo" na página "/my-promos"


# Editar promoção
Scenario: Editar uma promoção com sucesso
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Editar" da promoção "Promoção de Natal"
    Then O modal de edição de promoção é aberto 
    And Eu preencho o campo ID do Hotel com "10", 
                    o campo Desconto com "20", 
                    o campo Nome da Promoção com "Promoção de Natal", 
                    o campo Data de Início com "01/12/2024", 
                    o campo Data de Fim com "25/12/2024"
    And Eu clico no botão "Salvar Edição"
    Then Eu vejo a mensagem "Promoção editada com sucesso!"
    Then Eu clico no botão "Ok"
    Then O modal de edição de promoção é fechado
    Then Eu vejo a promoção "Promoção de Natal" na página "/my-promos" com 
        ID do Hotel "10", 
        Desconto "20", 
        Data de Início "01/12/2024", 
        Data de Fim "25/12/2024" 

Scenario: Editar uma promoção sem sucesso por erro no campo de data
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Editar Promoção" da promoção "Promoção de Natal"
    Then O modal de edição de promoção é aberto 
    And Eu preencho o campo ID do Hotel com "10", 
                    o campo Desconto com "20", 
                    o campo Nome da Promoção com "Promoção de Natal", 
                    o campo Data de Início com "25/12/2024", 
                    o campo Data de Fim com "01/12/2024"
    And Eu clico no botão "Salvar Edição"
    Then Eu vejo a mensagem "Datas Inválidas: A data de fim deve ser posterior a data de início."
    Then Eu não vejo a promoção "Promoção de Natal" na página "/my-promos"


Scenario: Editar uma promoção sem sucesso por erro no campo de desconto
    Given Eu estou na página "/my-promos"
    When Eu clico no botão "Editar Promoção" da promoção "Promoção de Natal"
    Then O modal de edição de promoção é aberto 
    And Eu preencho o campo ID do Hotel com "10", 
                    o campo Desconto com "150", 
                    o campo Nome da Promoção com "Promoção de Natal", 
                    o campo Data de Início com "01/12/2024", 
                    o campo Data de Fim com "25/12/2024"
    And Eu clico no botão "Salvar Edição"
    Then Eu vejo a mensagem "Desconto Inválido: O percentual de desconto deve ser um número entre 1 e 100."
    Then Eu não vejo a promoção "Promoção de Natal" na página "/my-promos"