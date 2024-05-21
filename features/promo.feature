Feature: Cadastro e manutenção de promoções (inserir, remover, atualizar)
As a administrador do sistema 
I want to ser capaz de criar, remover e atualizar promoções
So that o usuário possa fazer reservas com valores promocionais

Scenario: Lista de promoções cadastradas vazia
    Given existe pelo menos uma promoção cadastrada pelo administrador "Gabriel"
    When "Gabriel" abrir a tela "Cadastrar promoção"
    Then vai ser exibido uma lista com todos as promoções cadastradas para cada imóvel na tela de "Promoções cadastradas"

Scenario: Lista de promoções cadastradas não vazia
    Given nenhuma promoção foi cadastrada pelo administrador "Gabriel"
    When "Gabriel" abrir a tela "Cadastrar promoção"
    Then vai ser exibido uma mensagem indicando que nenhuma promoção foi cadastrado no sistema na tela de "Promoções cadastradas"

Scenario: Preenchimento correto dos campos na tela "Cadastrar promoção"
    Given o administrador "João" está na tela "Cadastrar promoção"
    When "João" preenche todos os campos obrigatórios corretamente, ou seja, sem nenhum erro de formatação
    Then o sistema desabilita a opção de salvar e enviar promoção para aquele imóvel até que todos os campos sejam preenchidos
    And "João" pode salvar e enviar a opção as informações cadastradas no sistema 
    And o sistema salva as informações preenchidas com o id "050505"

Scenario: Preenchimento incorreto dos campos na tela "Cadastrar promoção"
    Given o administrador "João" está na tela "Cadastrar promoção"
    When "João" faz o preenchimento incorreto dos campos na tela "Cadastrar promoção"
    Then o sistema desabilita a opção de salvar e enviar promoção para aquele imóvel até que todos os campos sejam preenchidos

Scenario: Preenchimento correto dos campos na tela "Editar promoções"
    Given o administrador "Maria" está na tela "Editar promoções"
    When "Maria" preenche todos os campos obrigatórios corretamente, ou seja, sem nenhum erro de formatação
    Then "Maria" pode salvar e enviar as edições para o sistema 
    And o sistema salva as informações preenchidas com o id "060606"

Scenario: Preenchimento incorreto dos campos na tela "Editar promoções"
    Given o administrador "Maria" está na tela "Editar promoções"
    When "Maria" faz o não faz o preenchimento correto dos campos na tela "Editar Promoções"
    Then o sistema desabilita a opção de salvar alterações 

Scenario: administrador seleciona a opção para cadastrar uma nova promoção
    Given "Beatriz" está na página "Cadastrar promoção"
    When "Beatriz" seleciona a opção para cadastrar uma nova promoção
    Then "Beatriz" é direcionada a tela "Inserir informações"
    And os campos "Desconto percentual", "nome da promoção", "data de início" e "data de fim" são disponibilizados para preenchimento

Scenario: Cadastro de promoções bem sucedido
    Given "Fernando" está na tela "Cadastrar promoção"
    And ele possui um imóvel disponível para ser resevado pelo usuário
    And não existem promoções cadastradas para esse imóvel
    When "Fernando" seleciona a opção de cadastrar uma nova promoção
    And "Fernando" faz o preenchimento correto dos campos na tela "Cadastrar promoção"
    Then o sistema habilita a opção de  salvar e enviar promoção para aquele imóvel até que todos os campos sejam preenchidos
    And o adm

Scenario: Cadastro de promoções mal-sucedido por falta de campos prenchidos
    Given "Fernando" está na tela "Cadastrar promoção"
    And ele possui pelo menos um imóvel disponível para ser resevado pelo usuário
    And não existem promoções cadastradas para esse imóvel
    When "Fernando" seleciona a opção de cadastrar uma nova promoção
    And "Fernando" faz o preenchimento incorreto dos campos na tela "Cadastrar promoção"
    And não é possível enviar as informações para cadastro de nova promoção

## extra: 
Scenario: Cadastro de promoções mal-sucedido por campos prenchidos indevidadamente
    Given "Fernando" está na tela "Cadastrar promoção"
    And ele possui pelo menos um imóvel disponível para ser resevado pelo usuário
    And não existem promoções cadastradas para esse imóvel
    When "Fernando" seleciona a opção de cadastrar uma nova promoção
    Then uma nova página é aberta para preenchimentos dos campos "Desconto percentual", "nome da promoção", "data de início" e "data de fim"
    And "Fernando" preenche indevidadamente ou com uma formatação diferente da esperada pelo campos ou não é escrito nada no campos
    And não é possível enviar as informações para cadastro de nova promoção
##

Scenario: Excluir promoções com promoções cadastradas (lixeira)
    Given "Iasmin" está na tela "Promoções cadastradas"
    And a lista de promoções cadastradas não está vazia
    And "Iasmin" quer excluir uma promoção cadastrada
    When "Iasmin" seleciona a opção para excluir promoção de id "020202" cadastrada 
    Then o sistema remove a promoção de id "020202" e atualiza a tela
    And uma mensagen de confirmação de exclusão é mostrada ao administrador 

Scenario: administrador é redirecionado para a tela "Editar promoções" (caneta)
    Given "Marcos" está na tela "Promoções cadastradas"
    And a lista de promoções cadastradas não está vazia 
    When "Marcos" seleciona a opção para editar promoção de id "030303"
    Then "Marcos" é redirecionado para a tela "Editar promoções"

Scenario: Edição de promoção bem-sucedida
    Given "Marcos" está na tela "Editar promoções"
    When "Marcos" faz o preenchimento correto dos campos na tela "Editar promoções"
    Then uma mensagem de confirmação de edição é mostrada a "Marcos"  

Scenario: Edição de promoção mal-sucedida
    Given "Marcos" está na tela "Editar promoções"
    When "Marcos" faz o preenchimento incorreto dos campos na tela "Editar promoções"
    Then "Marcos" não consegue salvar sua edição 

Scenario: Editar promoções com promoções cadastradas
    Given "Marcos" está na tela "Editar promoções"
    When "Marcos" faz uma edição bem-sucedida 
    Then

Scenario: Editar promoções sem promoções cadastradas
    Given
    When
    Then


------------
Como a promoção afeta a tela de hoteis disponíveis