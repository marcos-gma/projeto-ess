Feature: Gostar, Salvar e Compartilhar
    Como um usuário 
    Eu quero curtir, salvar e compartilhar hoteis
    Para que eu possa guardar hoteis que gostei e recomenda-los para outras pessoas
    
    Scenario: Visualizar Página
        Given o usuário “Guilherme” realizou uma busca básica 
        And está visualizando uma lista de hotéis baseada nas informações dadas
        When “Guilherme” clica em “Pousada Maresia” 
        Then a página de “Pousada Maresia” é aberta na tela

    Scenario: Marcar que gostou do hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia” 
        And o número de curtidas de “Pousada Maresia” é “5”
        And Lista de Curtidas” no perfil de “Guilherme” está vazia
        When “Guilherme” clica em curtir a  “Pousada Maresia”
        Then o número de curtidas de “Pousada Maresia” é “6”
        And a “Lista de Curtidas” no perfil de “Guilherme” contém apenas “Pousada Maresia”   
    
    Scenario: Desmarcar que gostou do hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia” 
        And “Pousada Maresia”  está em sua lista de curtidas 
        And o número de curtidas de “Pousada Maresia” é “6”
        When “Guilherme” clica em curtir a  “Pousada Maresia”
        Then o número de curtidas de “Pousada Maresia” é “5”
        And “Pousada Maresia” não está mais na “Lista de Curtidas” no perfil de “Guilherme”

    Scenario: Salvar o hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia”
        And  “Lista de hotéis salvos” no perfil de “Guilherme” contém “Hotel Brisa”
        When “Guilherme” clica em salvar a  “Pousada Maresia”
        Then  a “Lista de hotéis salvos” no perfil de “Guilherme” contém a “Pousada Maresia” e “Hotel Brisa”

    Scenario: Gerenciar a lista de hotéis salvos
        Given o usuário “Guilherme” está visualizando a página de “Perfil do usuário”
        And a lista de hotéis salvos contém a “Pousada Maresia”
        When “Guilherme” clica em deletar a “Pousada Maresia” 
        Then  a lista de hotéis salvos não contém a “Pousada Maresia”

    Scenario: Compartilhar hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia”
        When “Guilherme” clica em compartilhar a “Pousada Maresia” 
        Then  Uma lista de opções de lugares para enviar “Pousada Maresia” aparece contendo “Whatsapp”, “Instagram” e “X”  
        And um link de "Pousada Maresia" aparece na tela para poder ser copiado por "“Guilherme” 

    Scenario: Nova Curtida no Servidor
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia”
        And a lista de hotéis curtidos por “Guilherme” está vazia
        When “Guilherme” clica em curtir a  “Pousada Maresia”
        Then peço ao servidor para armazenar a “Pousada Maresia” na “Lista de Curtidas” associada ao usuário “Guilherme”
        And a “Lista de Curtidas” associada a “Guilherme” no servidor contém apenas “Pousada Maresia” 

    Scenario: Novo Item Salvo no Servidor
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia”
        And a lista de hotéis salvos por “Guilherme” contém “Hotel Brisa”
        When “Guilherme” clica em salvar a  “Pousada Maresia”
        Then peço ao servidor para armazenar a “Pousada Maresia” na “Lista de Itens Salvos”” associada ao usuário “Guilherme”
        And a “Lista de Itens Salvos” associada a “Guilherme” no servidor contém a “Pousada Maresia” e “Hotel Brisa”