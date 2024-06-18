Feature: Realizar reserva
    Como um hóspede
    Quero realizar uma reserva em uma acomodação
    Para que eu possa usufruir da minha estadia nessa acomodação

    GUI:

    Scenario: Verificar disponibilidade em uma Acomodação disponível
        Given Usuário "felipe" está na página da hospedagem "KM Hostel"
        When Usuário insere data de check-in "25/08/2024"
        And Usuário insere data de check-out é "28/08/2024"
        And Usuário insere que estadia será para "4" Pessoas
        Then Sistema informa a hospedagem como "disponível"  dentro das informações de estadia
        And Opção "Reservar" fica disponível para ser selecionada

    Scenario: Verificar disponibilidade em uma Acomodação indisponível
        Given Usuário "felipe" está na página da hospedagem "KM Hostel"
        When Usuário insere data de check-in "25/08/2024"
        And Usuário insere data de check-out é "28/08/2024"
        And Usuário insere que estadia será para "4" Pessoas
        Then Sistema informa a hospedagem como "indisponível"  dentro das informações de estadia
        And Opção "Reservar" fica indisponível para ser selecionada

    Scenario: Página de Realização da Reserva com dados atualizados
        Given Usuário "felipe" selecionou a opção "Reservar" após verificar disponibilidade da hospedagem
        When Usuário "felipe" confirma dados prenchidos no cadastro sem alterações
        And prossegue com o processo de reserva
        Then Usuário é redirecionado para a página de pagamentos

    Scenario: Página de Realização de Reserva com dados desatualizados
        Given Usuário "felipe" selecionou a opção "Reservar" após verificar disponibilidade da hospedagem
        When Usuário "felipe" modifica o número de telefone para "81998877663"
        And prossegue com o processo de reserva
        Then Usuário é redirecionado para a página de pagamentos
        And dados modificados do usuário "felipe" são alterados no seu perfil

    Scenario: Efetuar reserva de acomodação com sucesso
        Given usuário "iasmin" está na página "Métodos de Pagamento"
        And tem um cartão de número de card_number "5555 5555 5555 5555" e type "debit" selecionado
        When usuário seleciona opção "Confirmar Pagamento"
        Then Pagamento do valor da estadia de "300" reais é efetuado através do cartão selecionado
        And Usuário vai para página "Informações de Reserva" e verifica dados da sua reserva de id_reservation "8898"

    Scenario: Acessar página de editar reserva
        Given usuário "iasmin" está na página "Meu Perfil"
        And na seção "Reservas" se encontra a reserva de id_acom "4554"
        And quantidade de diárias é "3"
        When usuário seleciona opção "Editar Data da Hospedagem"
        And Seleciona "12/09/2024" como nova data de check-in
        #checkout é calculado automaticamente por conta de não poder mudar quantidade de diárias
        Given usuário "iasmin" está na página "Meu Perfil"
        And na seção "Reservas" a reserva de id_acom "4554" teve sua data de check-in modificada para dia "12/09/2024"
        And sua data de check-out modificada para dia "15/09/2024"


    Scenario: Cancelar reserva
        Given usuário "iasmin" está na página "Meu Perfil"
        And na seção "Reservas" se encontra a reserva de id_acom "4554"
        When usuário seleciona a opção "Cancelar Reserva"
        And Confirma o cancelamento da reserva avisando das dificuldades do reembolso
        Then Reserva não se encontra mais na seção "Reservas"


    Service:

    Scenario: Verificar disponibilidade em uma Acomodação disponível
        Given Usuário de id "1234" se encontra na página da acomodação de acom_id "3223"
        When Usuário insere data de check-in "25/08/2024"
        And Usuário insere data de check-out é "28/08/2024"
        And Usuário insere que estadia será para "4" Pessoas
        Then Sistema calcula com base nas datas de "3" diárias dando o valor de "300" reais
        And verifica se número máximo de pessoas na acomodação é menor que "4" pessoas
        And valor da função disponibility é "True", indicando que acomodação está disponível
        And ativando opção "reservar"
    # Descobrir como fazer operação envolvendo disponibilidade do sistema, alguma variável
    # local da página que ative o botão de reservar se hospedagem estiver de fato disponível

    Scenario: Verificar disponibilidade em uma Acomodação indisponível
        Given Usuário de id "1234" se encontra na página da acomodação de acom_id "3223"
        When Usuário insere data de check-in "25/08/2024"
        And Usuário insere data de check-out é "28/08/2024"
        And Usuário insere que estadia será para "4" Pessoas
        Then Sistema calcula com base nas datas de "3" diárias dando o valor de "300" reais
        And verifica se número máximo de pessoas na acomodação é menor que "4" pessoas
        And valor da função disponibility é "False", indicando que acomodação está indisponível

    Scenario: Página de Realização de Reserva com dados desatualizados
        Given Usuário de id "1234" quer realizar uma reserva na acomodação de acom_id "3223"
        And selecionou a opção "Reservar" após verificar disponibilidade da hospedagem
        When Usuário "felipe" modifica o número de telefone para "81998877663"
        And prossegue com o processo de reserva
        Then sistema verifica que phone foi mudado de "81911223344" para "81998877663"
        And Uma requisição PUT é enviada ao sistema com os parâmetros modificados
        And dados modificados do usuário de id "1234" são alterados no seu perfil
        Then Usuário é redirecionado para a página "Métodos de Pagamento"

    Scenario: Página de Realização de Reserva com dados atualizados
        Given Usuário de id "1234" quer realizar uma reserva na acomodação de acom_id "3223"
        And selecionou a opção "Reservar" após verificar disponibilidade da hospedagem
        When sistema verifica que dados não foram modificados
        Then Usuário é redirecionado para a página "Métodos de Pagamento"

    Scenario: Efetuar reserva de acomodação concluída com sucesso
        Given usuário de id "1234" quer efetuar o pagamento para reservar a acomodação de id_acom "3223"
        And se encontra na página "Métodos de Pagamento"
        And valor do pagamento é value "300"
        And tem um cartão de número de card_number "5555 5555 5555 5555" e type "debit" com status "True"
        When usuário seleciona opção "Confirmar Pagamento"
        Then Pagamento do valor da estadia de "300" reais é efetuado através do cartão "5555 5555 5555 5555"
        And código de resposta é "200" and solicitação POST é enviada para servidor
        Then Feature de "Disparo de Emails" é ativada

    Scenario: Editar reserva
        Given usuário de id "2222" está na página "Meu Perfil"
        And na seção "Reservas" se encontra a reserva de id_acom "4554"
        And Data de check-in é "12/09/2024"
        And Data de check-out é "15/09/2024"
        When usuário seleciona a opção "Editar Reserva"
        And usuário seleciona "18/09/2024" como nova data de check-in
        Then seção "Reservas" da Página "Meu Perfil" atualiza novas datas de estadia
        Then Requisção PUT é executada para modificar data de check-in para "18/09/2024"
        And data de checkout para "21/09/2024" na página


    Scenario: Cancelar reserva
        Given usuário de id "2222" está na página "Meu Perfil"
        And na seção "Reservas" se encontra a reserva de id_acom "4554"
        When usuário seleciona a opção "Cancelar Reserva"
        And Confirma o cancelamento da reserva
        Then Requisição DELETE é executada para remover dados de reserva da acomodação e do usuário



