Feature: Cadastro e manutenção de promoções (inserir, remover, atualizar)
As a administrador do sistema 
I want to ser capaz de criar, remover e atualizar promoções
So that o usuário possa fazer reservas com valores promocionais

Scenario: Lista de Promoções Cadastradas não vazia 
    Given o administrador "Gabriel" já cadastrou uma promoção para a prorpriedade de nomeProp "Casa em Porto"
    Then "Gabriel" visualiza a promoção associada à propriedade de nomeProp "Casa em Porto"
    And todas as promoções cadastradas são exibidas na lista
    
Scenario: Lista de Promoções Cadastradas vazia OK
    Given nenhuma promoção foi cadastrada pelo administrador "Gabriel"
    When "Gabriel" abre a tela "Promoções Cadastradas"
    Then uma mensagem indicando que nenhuma promoção foi cadastrada é exibida
    And a lista de promoções está vazia
    
Scenario: Seleção da opção "Cadastrar Nova Promoção"
    Given "Beatriz" está na página "Promoções Cadastradas"
    When "Beatriz" seleciona a opção "Cadastrar Nova Promoção"
    Then ela é direcionada para a tela "Cadastrar Promoção"
    And os campos para preenchimento das informações da nova promoção são exibidos


Scenario: Cadastro com sucesso de nova promoção
    Given o administrador "João" está na tela "Cadastrar Promoção"
    When "João" preenche os campos:
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    And "João" seleciona a opção "Salvar e Enviar"
    Then uma mensagem de sucesso é exibida para "João"
    And "João" é redirecionado para a tela "Promoções Cadastradas"
    And a nova promoção cadastrada é exibida na lista de promoções com os dados:
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |


Scenario: Cadastro falho de nova promoção
    Given o administrador "João" está na tela "Cadastrar Promoção"
    When "João" preenche os campos:
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 20%      | "          "    | 12/05/2024  | 20/05/2024  |
    And "João" seleciona a opção "Salvar e Enviar"
    Then uma mensagem de erro indicando o preenchimento inadequado das informações é exibida para "João"
    And "João" permanece na tela "Cadastrar Promoção"
    And os campos preenchidos previamente são mantidos com seus valores
    And a promoção não é adicionada à lista de promoções cadastradas

Scenario: Excluir promoções na tela "Promoções Cadastradas"
    Given "Iasmin" está na tela "Promoções Cadastradas"
    And a lista de promoções cadastradas contém as promoções:
    | id  | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    |  1  | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    |  2  | Apartamento SP | 15%      | Black Friday    | 24/11/2024  | 28/11/2024  |
    When "Iasmin" seleciona a opção para excluir a promoção associada à propriedade "Casa em Porto"
    Then uma mensagem de confirmação de exclusão é exibida para "Iasmin"
    And a promoção "Casa em Porto" é removida da lista de promoções cadastradas
    And somente a promoção "Apartamento SP" permanece visível na lista


Scenario: Administrador é redirecionado para a tela "Editar promoções"
    Given "Marcos" está na tela "Promoções Cadastradas"
    And "Marcos" visualiza a lista de promoções cadastradas com as promoções:
    | id  | nomeProp        | desconto | promoName       | data_inicio | data_fim    |
    |  1  | Quarto em Olinda| 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    |  2  | Apartamento SP  | 15%      | Black Friday    | 24/11/2024  | 28/11/2024  |
    When "Marcos" seleciona a opção para editar a promoção associada à propriedade "Quarto em Olinda"
    Then "Marcos" é redirecionado para a tela "Editar Promoções"
    And os campos da promoção "Quarto em Olinda" são exibidos para edição


Scenario: Editar com sucesso na tela "Editar promoções"
    Given o administrador "Maria" está na tela "Editar promoções"
    And "Maria" visualiza os campos preenchidos da promoção associada à propriedade "Casa em Porto":
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    When "Maria" edita os campos:
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 25%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    And "Maria" seleciona a opção "Salvar e Enviar"
    Then uma mensagem de sucesso é exibida para "Maria"
    And "Maria" é redirecionada para a tela "Promoções Cadastradas"
    And a promoção "Casa em Porto" é atualizada com o desconto de 25% na lista de promoções cadastradas


Scenario: Editar sem sucesso na tela "Editar promoções"
    Given o administrador "Maria" está na tela "Editar promoções"
    And "Maria" visualiza os campos preenchidos da promoção associada à propriedade "Casa em Porto":
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 10%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    When "Maria" edita os campos:
    | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    And "Maria" seleciona a opção "Salvar e Enviar"
    Then uma mensagem de erro indicando o preenchimento inadequado das informações é exibida para "Maria"
    And "Maria" permanece na tela "Editar Promoções"
    And os campos preenchidos previamente são mantidos com seus valores
    
------------
SOBRE O HOME:

Scenario: Há promoções ativas
    Given o administrador "Gabriel" cadastrou uma nova promoção com sucesso para a propriedade com corpo:
        { 
            "nomeProp": "Casa em Porto",
            "desconto": "20%",
            "promoName": "Dia das mães",
            "data_inicio": "12/05/2024",
            "data_fim": "20/05/2024"
        }
    And "Matheus" está na tela "Home"
    When "Matheus" seleciona a opção para ver as promoções ativas
    Then ele vê a promoção cadastrada por "Gabriel" com corpo:
        { 
            "nomeProp": "Casa em Porto",
            "desconto": "20%",
            "promoName": "Dia das mães",
            "data_inicio": "12/05/2024",
            "data_fim": "20/05/2024"
        }


Scenario: Não há promoções ativas
    Given a lista de promoções cadastradas é vazia
    And "Matheus" está na tela "Home"
    When "Matheus" seleciona as opções para ver as promoções ativas
    Then o sistema retorna uma mensagem indicando a ausência de promoções cadastradas


Scenario: Usuário reserva propriedade em promoção
    Given as seguintes promoções estão ativas no sistema:
      | nomeProp            | desconto | promoName      | data_inicio | data_fim   |
      | "Park Hotel Caruaru"| "20%"    | "Dia das mães" | "12/05/2024"| "20/05/2024" |
      | "Casa em Gravatá"   | "15%"    | "Black Friday" | "24/11/2024"| "28/11/2024" |
      | "Chalé MG"          | "30%"    | "Natal"        | "20/12/2024"| "26/12/2024" |

    And "Duda" está na tela "Promoções Ativas"
    When "Duda" seleciona a opção de realizar reserva para a propriedade "Chalé MG"
    Then "Duda" é direcionada a tela "Realizar Reserva"

    
---------------------------------
SERVICE:
Scenario: Lista de promoções cadastradas não vazia
    Given há as seguintes promoções cadastradas no sistema:
        | id  | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
        |  1  | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
        |  2  | Apartamento SP | 15%      | Black Friday    | 24/11/2024  | 28/11/2024  |
        |  3  | Chalé MG       | 30%      | Natal           | 20/12/2024  | 26/12/2024  |
    When uma nova requisição GET é feita para o endpoint "/promocoes_cadastradas"
    And o código de resposta é "200" # 200 ok
    Then o sistema retorna as promoções com corpo:
        [
            { 
                "id": 1,
                "nomeProp": "Casa em Porto",
                "desconto": "20%",
                "promoName": "Dia das mães",
                "data_inicio": "12/05/2024",
                "data_fim": "20/05/2024"
            },
            { 
                "id": 2,
                "nomeProp": "Apartamento SP",
                "desconto": "15%",
                "promoName": "Black Friday",
                "data_inicio": "24/11/2024",
                "data_fim": "28/11/2024"
            },
            { 
                "id": 3,
                "nomeProp": "Chalé MG",
                "desconto": "30%",
                "promoName": "Natal",
                "data_inicio": "20/12/2024",
                "data_fim": "26/12/2024"
            }
        ]


Scenario: Lista de promoções cadastradas vazia
    Given o administrador "Gabriel" não cadastrou nenhuma promoção no sistema
    When uma nova requisição GET é feita para o endpoint "/promocoes_cadastradas"
    And o código de resposta é "200"
    Then o sistema retorna uma lista vazia 


Scenario: Cadastro com sucesso de nova promoção
    Given o administrador "João" deseja cadastrar uma nova promoção
    When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
        {
            "nomeProp": "Park Hotel Caruaru",
            "desconto": "20%",
            "promoName": "Dia das mães",
            "data_inicio": "12/05/2024",
            "data_fim": "20/05/2024"
          }
    Then o sistema retorna o código de resposta "201" # created
    And o sistema retorna a promoção cadastrada com o corpo:
        {
            "id": 1,
            "nomeProp": "Park Hotel Caruaru",
            "desconto": "20%",
            "promoName": "Dia das mães",
            "data_inicio": "12/05/2024",
            "data_fim": "20/05/2024"
          }


Scenario: Cadastro falho de nova promoção malsucedido
    Given o administrador "João" deseja cadastrar uma nova promoção
    When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
      {
        "nomeProp": "Park Hotel Caruaru",
        "desconto": "20%",
        "promoName": "",
        "data_inicio": "12/05/2024",
        "data_fim": "20/05/2024"
      }
    Then o sistema retorna o código de resposta "400" # bad request
    And o sistema retorna uma mensagem de erro indicando o preenchimento inadequado das informações


Scenario: Excluir promoções
    Given há as seguintes promoções cadastradas no sistema:
    | id  | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    |  1  | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    |  2  | Apartamento SP | 15%      | Black Friday    | 24/11/2024  | 28/11/2024  |
    When "Iasmin" faz uma requisição DELETE para o endpoint "/promocoes_cadastradas/1" # (ID da promoção)
    Then o sistema retorna o código de resposta "200" # ok
    And o sistema retorna uma mensagem de confirmação de exclusão
    And ao fazer uma requisição GET para o endpoint "/promocoes_cadastradas"
    Then a única promoção visível é a de corpo:
    { 
        "id": 2,
        "nomeProp": "Apartamento SP",
        "desconto": "15%",
        "promoName": "Black Friday",
        "data_inicio": "24/11/2024",
        "data_fim": "28/11/2024"
    }


Scenario: Editar promoção com sucesso
    Given há as seguintes promoções cadastradas no sistema:
    | id  | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    |  1  | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    When "Maria" faz uma requisição PUT para o endpoint "/promocoes_cadastradas/1" (ID da promoção) com o corpo:
      {
        "nomeProp": "Casa em Porto",
        "desconto": "25%", # mudou aqui
        "promoName": "Dia das mães",
        "data_inicio": "12/05/2024",
        "data_fim": "20/05/2024"
      }
    Then o sistema retorna o código de resposta "200" # ok
    And o sistema retorna a promoção atualizada com o corpo:
      {
        "id": 1,
        "nomeProp": "Casa em Porto",
        "desconto": "25%",
        "promoName": "Dia das mães",
        "data_inicio": "12/05/2024",
        "data_fim": "20/05/2024"
      }


Scenario: Editar promoção sem sucesso
    Given há as seguintes promoções cadastradas no sistema:
    | id  | nomeProp       | desconto | promoName       | data_inicio | data_fim    |
    |  1  | Casa em Porto  | 20%      | Dia das mães    | 12/05/2024  | 20/05/2024  |
    When "Maria" faz uma requisição PUT para o endpoint "/promocoes_cadastradas/1" (ID da promoção) com o corpo:
      {
        "nomeProp": "Casa em Porto",
        "desconto": "20%",
        "promoName": "",
        "data_inicio": "12/05/2024",
        "data_fim": "20/05/2024"
      }
    Then o sistema retorna o código de resposta "400" # bad request
    And o sistema retorna uma mensagem de erro indicando o preenchimento inadequado das informações

--------------------
SOBRE O HOME:

Scenario: Há promoções ativas
    Given o administrador "Gabriel" cadastrou uma nova promoção com sucesso para a propriedade com nomeProp "Quarto em Paulista"
    And "Matheus" está no endpoint "/home"
    When "Matheus" faz uma requisição GET para o endpoint "/promocoes"
    Then o sistema retorna a promoção com nomeProp "Quarto em Paulista" no header da tela "Home"


Scenario: Não há promoções ativas
    Given a lista de promoções cadastradas é vazia
    And "Matheus" está no endpoint "/home"
    When "Matheus" faz uma requisição GET para o endpoint "/promocoes"
    Then o sistema retorna uma mensagem indicando a ausência de promoções cadastradas


Scenario: Usuário reserva propriedade em promoção
    Given as seguintes promoções estão ativas no sistema:
      | nomeProp            | desconto | promoName      | data_inicio | data_fim   |
      | "Park Hotel Caruaru"| "20%"    | "Dia das mães" | "12/05/2024"| "20/05/2024" |
      | "Casa em Gravatá"   | "15%"    | "Black Friday" | "24/11/2024"| "28/11/2024" |
      | "Chalé MG"          | "30%"    | "Natal"        | "20/12/2024"| "26/12/2024" |

    And "Duda" está no endpoint "/promocoes"
    When "Duda" faz uma requisição POST para o endpoint "/realizar_reserva/1"
    Then o sistema o código de resposta "200"




