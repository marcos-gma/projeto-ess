Feature: Cadastro e manutenção de promoções (inserir, remover, atualizar)
As a administrador do sistema 
I want to ser capaz de criar, remover e atualizar promoções
So that o usuário possa fazer reservas com valores promocionais

Scenario: Lista de Promoções Cadastradas não vazia OK
    Given o administrador "Gabriel" já cadastrou uma promoção para a prorpriedade de nome "Casa em Porto"
    When "Gabriel" abrir a tela "Promoções Cadastradas"
    Then vai ser exibido as informações da promoção associada a propriedade de nome "Casa em Porto"

Scenario: Lista de Promoções Cadastradas vazia OK
    Given nenhuma promoção foi cadastrada pelo administrador "Gabriel"
    When "Gabriel" abrir a tela "Promoções Cadastradas"
    Then vai ser exibido uma mensagem indicando que nenhuma promoção foi cadastrado no sistema na tela de "Promoções Cadastradas"

Scenario: Seleção da opção "Cadastrar Nova Promoção" OK
    Given "Beatriz" está na página "Cadastrar promoção"
    When "Beatriz" seleciona a opção "Cadastrar Nova Promoção"
    Then "Beatriz" é direcionada a tela "Cadastrar Promoção"

Scenario: Cadastro com sucesso de nova promoção OK
    Given o adm "João" está na tela "Cadastrar Promoção".
    When "Joao" preenche os campos nomeProp:
    "Park Hotel Caruaru", desconto: "20%", promoname:
    "Dia das mães", data_inicio: "12/05/2024", data_fim "20/05/2024".
    And "João" seleciona a opção "Salvar e Enviar"
    Then uma mensagem de sucesso é exibida para João.
    And "João" é direcionado para a tela "Promoções Cadastradas"
    And a promoção da prorpriedade de nomeProp "Park Hotel Caruaru" é mostrada na tela

Scenario: Cadastro falho de nova promoção por falta de informação OK
    Given o adm "João" está na tela "Cadastrar Promoção".
    When "Joao" preenche os campos nomeProp:
    "Park Hotel Caruaru", desconto: "20%", promoname:
    "", data_inicio: "12/05/2024", data_fim "20/05/2024".
    Then uma mensagem de erro indicando o preenchimento inadequado das informações.
    And "João" é direcionado para a tela "Cadastrar Promoção" 
    And os campos campos nomeProp, desconto, promoname, data_inicio e data_fim estão vazios

Scenario: Cadastro de mais de uma promoção por prorpriedade OK
    Given "Fernando" seleciona a opção "Cadastrar Nova Promoção"
    And a propriedade de nomeProp "Casa em Gravatá" já tem uma promoção cadastrada por "Fernando"
    And "Fernando" preenche o campo nomeProp com "Casa em Gravatá"
    When "Fernando" seleciona a opção "Salvar e Enviar"
    Then é exibida uma mensagem de erro indicando o preenchimento inadequado das informações
    And "João" é direcionado para a tela "Cadastrar Promoção" 
    And os campos campos nomeProp, desconto, promoname, data_inicio e data_fim estão vazios


Scenario: Excluir promoções na tela Promoções Cadastradas (lixeira) OK
    Given "Iasmin" está na tela "Promoções Cadastradas"
    And a lista de Promoções Cadastradas tem duas promoções de nomeProp: "Casa em Tamandaré" e "Quarto em BV"
    And "Iasmin" quer excluir uma promoção cadastrada
    When "Iasmin" seleciona a opção para excluir promoção de nomeProp: "Casa em Tamandaré" 
    Then o sistema remove a promoção de id de nomeProp: "Casa em Tamandaré"
    And uma mensagen de confirmação de exclusão é mostrada ao administrador 
    Then "Iasmin" é redirecioanda à tela "Promoções Cadastradas"
    And somente a promoção de nomeProp: "Quarto em BV" é exibida para "Iasmin"

Scenario: administrador é redirecionado para a tela "Editar promoções" (caneta)
    Given "Marcos" está na tela "Promoções Cadastradas"
    And "Marcos" tem duas promoções associadas ao nomeProp: "Quarto em Olinda" e "Kitnet em Recife" 
    When "Marcos" seleciona a opção para editar promoção de nomeProp "Quarto em Olinda"
    Then "Marcos" é redirecionado para a tela "Editar promoções"

Scenario: Edutar com sucesso na tela "Editar promoções"
    Given o administrador "Maria" está na tela "Editar promoções"
    When "Maria" preenche os campos nomeProp: "Park Hotel Caruaru", desconto: "20%", promoname: 
    "Dia das mães", data_inicio: "12/05/2024", data_fim "20/05/2024".
    And "Maria" seleciona a opção "Salvar e Enviar"
    Then uma mensagem de sucesso é exibida para Maria.
    And "Maria" é direcionada para a tela "Promoções Cadastradas"
    And a promoção da prorpriedade de nomeProp "Park Hotel Caruaru" é mostrada na tela
    And informações editadas são mostradas no lugar das antigas

Scenario: Editar sem sucesso na tela "Editar promoções"
    Given o administrador "Maria" está na tela "Editar promoções"
    When "Maria" preenche os campos nomeProp: "Park Hotel Caruaru", desconto: "20%", promoname:
    "", data_inicio: "12/05/2024", data_fim "20/05/2024".
    Then uma mensagem de erro indicando o preenchimento inadequado das informações é exibida para "Maria".
    And "Maria" é direcionada para a tela "Editar Promoções" 
    And os campos campos nomeProp, desconto, promoname, data_inicio e data_fim estão vazios
------------
Como a promoção afeta a tela de hoteis disponíveis

Scenario: Promoções ativas na tela "Home"
    Given o usuário "Matheus" está navegando na tela "Detalhes de Acomodação"
    And O administrador "Gabriel" fez o Cadastro com sucesso de uma nova promoção com nomeProp "Quarto em Paulista"
    When "Matheus" acessa a tela "Home" 
    Then a promoção do "Quarto em Paulista" é exibida no header da tela "Home"

Scenario: há promoção existente para aquele id
    Given o usuário "Felipe" está na página "Detalhes da acomodação"
    When "Felipe" seleciona a opção de promoção disponível
    Then o sistema requisita as informações da promoção associada ao id do hotel 
    And as informções da promoção associadas ao id do hotel são mostradas

Scenario: não há promoção existente para aquele id
    Given o usuário "Felipe" está na página "Detalhes da acomodação"
    When "Felipe" seleciona a opção de promoções disponíveis
    Then uma mensagem indicando a falta de promoções para aquele hotel é mostrada