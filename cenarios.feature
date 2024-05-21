Feature: Usuário Comum

    Cuida da parte de interação do programa com o usuário comum (hóspede ou proprietários)

    # Funcionalidade: Página de Cadastro e Login

    # Funcionalidade: Publicar Reservas

    # Funcionalidade: Gerenciar Reservas
    Feature: Gerenciar Reservas
      Como um hóspede
      Eu quero gerenciar minhas reservas
      Para que eu possa editar ou cancelar minhas reservas conforme necessário
    
      Scenario: Editar a duração da reserva
        Given que eu tenho uma reserva confirmada
        When eu acesso a opção de editar reserva
        And eu altero a duração da minha reserva
        And eu confirmo a alteração
        Then a duração da minha reserva deve ser atualizada
    
      Scenario: Editar a quantidade de hóspedes
        Given que eu tenho uma reserva confirmada
        When eu acesso a opção de editar reserva
        And eu altero a 'quantidade de adultos' para '2'
        And eu altero a 'quantidade de crianças' para '1'
        And eu confirmo a alteração
        Then a quantidade de hóspedes na minha reserva deve ser atualizada para '2 adultos' e '1 criança'
    
      Scenario: Cancelar a reserva
        Given que eu tenho uma reserva confirmada
        When eu acesso a opção de cancelar reserva
        And eu confirmo o cancelamento
        Then minha reserva deve ser cancelada
        And eu devo receber uma confirmação de cancelamento

    # Funcionalidade: Realizar Reserva (Felipe)
    Scenario: Procurar disponibilidade da Hospedagem para determinadas informações de Estadia
        Given Usuário "felipe" está na página da hospedagem "KM Hostel"
        When Usuário insere data de check-in "25/08/2024"
        And Usuário insere data de check-out é "28/08/2024"
        And Usuário insere que estadia será para "3" Adultos, "1" Criança em "2" Quartos
        Then Sistema lista as modalidades de quarto "Quarto Duplo" e "Quarto Triplo" como disponíveis nesse período de estadia
        And Recomendações filtram modalidades a partir das informações sobre a estadia

    Scenario: Página de Realização da Reserva com usuário logado
        Given Usuário "felipe" que selecionou a modalidades "Quarto Duplo" em quantidade "2"
        And Escolheu prosseguir com o processo de reserva
        When Usuário "felipe" confirmaa dados prenchidos no login
        And Confere tudo o que sua estadia inclui
        And prossegue com o processo de reserva
        Then Usuário é levado para a página de pagamentos

    Scenario: Página de Realização da Reserva com usuário não logado e cadastrado
        Given Usuário "Null" que selecionou a modalidades "Quarto Duplo" em quantidade "2"
        And Escolheu prosseguir com o processo de reserva
        When Usuário "Null" realiza login para realizar reserva com dados do cadastro
        Then Usuário "felipe" é levado até mesma página com seus dados de reserva preenchidos

    Scenario: Página de Realização da Reserva com usuário não logado e não cadastrado
        Given Usuário "Null" que selecionou a modalidade "Quarto Duplo" em quantidade "2"
        And Escolheu prosseguir com o processo de reserva
        When Usuário "Null" insere "pedro de oliveira martins" em nome completo
        And insere "pedrinhobolado@gmail.com" em Email
        And insere "121.234.231-22" em CPF
        And insere "81996968484" em Número
        And prossegue com o processo de reserva
        And Confere tudo o que sua estadia inclui
        Then Usuário é levado para a página de pagamentos


Feature: Conteúdo

    Cuida da parte de interação entre hóspedes e proprietários

    # Funcionalidade: Avaliação de Reservas (Felipe)
    Scenario: Acesso a página de Avaliações de uma Hospedagem
        Given usuário "felipe" está na página da hospedagem "KM Hostel"
        When usuário "felipe" seleciona a seção de avaliações
        Then usuário "felipe" é levado até a página de avaliações da hospedagem "KM Hostel"

    Scenario: Escrever avaliação não logado
        Given usuário "Null" está na página de avaliações da hospedagem "KM Hostel"
        And selecionou para realizar uma avaliação
        When usuário "Null" seleciona para escrever uma avaliação da hospedagem "KM Hostel"
        Then programa solicita login para prosseguir
        And usuário "felipe" é logado com sucesso
        And usuário "felipe" é levado até página de avaliações da hospedagem "KM Hostel"

    Scenario: Autorização de avaliação da hospedagem
        Given usuário "felipe" está na página de avaliações da hospedagem "KM Hostel"
        And selecionou para realizar uma avaliação
        When usuário "felipe" seleciona para escrever uma avaliação da hospedagem "KM Hostel"
        Then programa solicita número da sua reserva

    Scenario: Número de Reserva aprovado
        Given usuário "felipe" quer escrever uma avaliação sobre a hospedagem "KM Hostel"
        And programa solicitou número da reserva
        When usuário "felipe" inseriu "2233445566" em número da reserva
        And número de reserva é válido
        Then usuário "felipe" É levado até a página de Escrita da avaliação sobre a hospedagem "KM Hostel"

    Scenario: Número de Reserva negado
        Given usuário "felipe" quer escrever uma avaliação sobre a hospedagem "KM Hostel"
        And programa solicita número da reserva
        When usuário "felipe" inseriu "2233445566" em número da reserva
        And número de reserva é inválido
        Then usuário "felipe" recebe aviso de reserva não encontrada
        And continua na mesma página de solicitação da reserva

    Scenario: Confirmar avaliação
        Given usuário "felipe" está na página de escrever avaliação sobre a hospedagem "KM Hostel"
        When usuário "felipe" insere "5" em Limpeza
        And insere "4" em Exatidão do Anúncio
        And insere "5" em Check-in
        And insere "3" em Comunicação
        And insere "5" em Localização
        And insere "4" em Custo-benefício
        And insere "estou muito feliz com a minha estadia, aproveitei bastante" em Comentário
        And seleciona para concluir o comentário
        Then usuário "felipe" pré-visualiza como seu comentário será mostrado na página de avaliações
        And Comentário mostra nota "4,33" e comentário "estou muito feliz com a minha estadia, aproveitei bastante"
        And usuário "felipe" confirma comentário
        And usuário é avisado que comentário foi realizado


    # Funcionalidade: Busca de Reservas
    Scenario: Busca inicial baseada em Lugar, período de estadia, Quantidade de Adultos e Crianças
        Given Usuário "felipedurant" com data de nascimento "25/08/1998", celular "81992926644"
        e senha "felipe" está logado e na home
        When Usuário insere "Praia dos Carneiros" no Lugar que deseja hospedagem
        And insere data de check-in "25/08/2024" e data de check-out "28/08/2024"
        And e insere que os hóspedes serão "2" adultos e "1" criança
        And insere "2" na quantidade de quartos
        Then Usuário é levado até página de procura que contém hospedagem "KM Hostel"
        And Preço "350" é mostrado pelo custo de "2" diárias

# Funcionalidade: Salvar, Gostar e Compartilhar

Feature: Pagamento

Cuida da parte de pagamentos e promoções

# Funcionalidade: Cadastro e Manutenção de Métodos de Pagamento

# Funcionalidade: Cadastro e Manutenção de Promoções

# Funcionalidade: Disparo de Email com comprovante do pedido






