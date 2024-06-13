Feature: Realizar reserva
    Como um hóspede
    Quero realizar uma reserva em uma acomodação
    Para que eu possa usufruir da minha estadia nessa acomodação

    Scenario: Procurar disponibilidade da Hospedagem para determinadas informações de Estadia
        Given Usuário "felipe" está na página da hospedagem "KM Hostel"
        When Usuário insere data de check-in "25/08/2024"
        And Usuário insere data de check-out é "28/08/2024"
        And Usuário insere que estadia será para "3" Adultos, "1" Criança em "2" Quartos
        Then Sistema informa a hospedagem como "disponível"  dentro das informações de estadia
        And Opção "Reservar" fica disponível para ser selecionado

    # Scenario: Página de Realização da Reserva com usuário logado
    #     Given Usuário "felipe" que selecionou a opção "Reservar" após verificar disponibilidade da hospedagem
    #     And
    #     When Usuário "felipe" confirmaa dados prenchidos no login
    #     And prossegue com o processo de reserva
    #     Then Usuário é redirecionado para a página de pagamentos

    Scenario: Página de Realização da Reserva com usuário não logado e cadastrado
        Given Usuário "Null" que selecionou a modalidades "Quarto Duplo" em quantidade "2"
        And Escolheu prosseguir com o processo de reserva
        When Usuário "Null" realiza login para realizar reserva com dados do cadastro
        Then Usuário "felipe" é redirecionado até mesma página com seus dados de reserva preenchidos

    Scenario: Página de Realização da Reserva com usuário não logado e não cadastrado
        Given Usuário "Null" que selecionou a modalidade "Quarto Duplo" em quantidade "2"
        And Escolheu prosseguir com o processo de reserva
        When Usuário "Null" insere "pedro de oliveira martins" em nome completo
        And insere "pedrinhobolado@gmail.com" em Email
        And insere "121.234.231-22" em CPF
        And insere "81996968484" em Número
        And prossegue com o processo de reserva
        And Confere tudo o que sua estadia inclui
        Then Usuário é redirecionado para a página de pagamentos


