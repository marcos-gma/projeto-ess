Feature: Gostar, Salvar e Compartilhar
    Como um usuário 
    Eu quero gostar, salvar e compartilhar hoteis
    Para que eu possa guardar hoteis que gostei e recomenda-los para outras pessoas

    Scenario: Marcar que gostou do hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia” 
        And o número de curtidas de “Pousada Maresia” é “5”
        And Lista de Curtidas” no perfil de “Guilherme” está vazia
        When “Guilherme” clica em curtir a  “Pousada Maresia”
        Then o número de curtidas de “Pousada Maresia” é “6”
        And a “Lista de Curtidas” no perfil de “Guilherme” contém apenas “Pousada Maresia” 

    Scenario: Salvar o hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia”
        And  “Lista de hotéis salvos” no perfil de “Guilherme” contém “Hotel Brisa”
        When “Guilherme” clica em salvar a  “Pousada Maresia”
        Then  a “Lista de hotéis salvos” no perfil de “Guilherme” contém a “Pousada Maresia” e “Hotel Brisa”

    Scenario: Compartilhar hotel
        Given o usuário “Guilherme” está visualizando a página de “Pousada Maresia”
        When “Guilherme” clica em compartilhar a “Pousada Maresia” 
        Then  Uma lista de opções de lugares para enviar “Pousada Maresia” aparece contendo “Whatsapp”, “Instagram” e “X”   