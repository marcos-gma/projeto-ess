Feature: Avaliação de Hospedagem

    Como um hóspede
    Quero poder verificar avaliações da hospedagem de interesse
    Também quero poder avaliar uma hospedagem após estadia
    Para que eu possa ver e compartilhar experiências nessa estadia com outros usuários

    Scenario: Acesso a página de Avaliações de uma Hospedagem
        Given usuário "felipe" está na página da hospedagem "KM Hostel"
        When usuário "felipe" seleciona a seção de avaliações
        Then usuário "felipe" é redirecionado até a página de avaliações da hospedagem "KM Hostel"

    Scenario: Escrever avaliação não logado
        Given usuário "Null" está na página de avaliações da hospedagem "KM Hostel"
        And selecionou para realizar uma avaliação
        When usuário "Null" seleciona para escrever uma avaliação da hospedagem "KM Hostel"
        Then programa solicita login para prosseguir
        And usuário "felipe" é logado com sucesso
        And usuário "felipe" é redirecionado até página de avaliações da hospedagem "KM Hostel"

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
        Then usuário "felipe" É redirecionado até a página de Escrita da avaliação sobre a hospedagem "KM Hostel"

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
