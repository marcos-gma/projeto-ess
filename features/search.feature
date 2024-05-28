
Feature: Busca com Filtros
    Como um usuário
    Eu quero buscar hoteis de forma filtrada 
    Para que eu encontre um hotel que se adeque a minhas necessidades
    
    Scenario: Busca com Filtros
        Given o hotel “Pousada Maresia” em “Fernando de Noronha” está cadastrado no sistema com vagas de “21/05” a “24/05” para “2” pessoas por menos de “3000” reais e sendo “Pet Friendly” 
        And o hotel “Morada do Mar” em “Fernando de Noronha” está cadastrado no sistema com vagas de “21/05” a “24/05” para “2” pessoas por menos de “3000” reais e sendo “Não Pet Friendly” 
        And o usuário “Guilherme” clicou na “barra de pesquisa”
        And “Guilherme” preenche a data de ida como “21/05” e de volta no dia “24/05”
        And o destino como “Fernando de Noronha”
        And a quantidade de pessoas como “2”
        When “Guilherme” clica em buscar
        Then os hotéis “Pousada Maresia” e “Moradia do Mar” aparecem na tela
        And opções de filtro são disponibilizadas na tela
        When “Guilherme” clica no filtro de faixa de preço e coloca “3.000” como valor limite
        And seleciona a opção de filtro Pet Friendly
        And “Guilherme” clica em buscar
        Then apenas a “Pousada Maresia” aparece na tela

    Scenario: Busca Mal Sucedida
        Given o usuário “Guilherme” clicou na “barra de pesquisa”
        And “Guilherme” preenche a data de ida como “21/05” e de volta no dia “24/05”
        And o destino como “Fernando de Noronha”
        When “Guilherme” clica em buscar
        Then uma mensagem de erro aparece na tela indicando que a falta da informação de “quantidade de pessoas”
        And volta para a tela de pesquisa com os dados da data de ida como “21/05” e de volta no dia “24/05”
        And destino como “Fernando de Noronha” 
        And quantidade de pessoas “_”