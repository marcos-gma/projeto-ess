# Funcionalidade: Página de Cadastro e Login


# Funcionalidade: Publicar Reservas
Feature: Publicar Reserva
    Como um usuário comum
    Eu quero publicar uma acomodação
    Para que outras pessoas possam reservar meu espaço

    Scenario: Inserir dados da acomodação
        Given que eu sou um usuário autenticado
        When eu acesso a opção de publicar acomodação
        And eu insiro a quantidade de quartos como 2
        And eu insiro a quantidade máxima de hóspedes como 4
        And eu insiro a quantidade de banheiros como 1
        And eu insiro a localização como "Rua Exemplo, 123, Cidade Exemplo"
        And eu insiro o preço por noite como 150
        And eu adiciono fotos da acomodação
        And eu confirmo a publicação
        Then minha acomodação deve ser publicada com os dados fornecidos

    Scenario: Inserir dados incompletos
        Given que eu sou um usuário autenticado
        When eu acesso a opção de publicar acomodação
        And eu insiro a quantidade de quartos como 2
        And eu insiro a quantidade máxima de hóspedes como 4
        And eu insiro a quantidade de banheiros como 1
        And eu deixo a localização em branco
        And eu insiro o preço por noite como 150
        And eu adiciono fotos da acomodação
        And eu tento confirmar a publicação
        Then eu devo ver uma mensagem de erro indicando que a localização é obrigatória
        And a acomodação não deve ser publicada

    Scenario: Publicar acomodação sem fotos
        Given que eu sou um usuário autenticado
        When eu acesso a opção de publicar acomodação
        And eu insiro a quantidade de quartos como 2
        And eu insiro a quantidade máxima de hóspedes como 4
        And eu insiro a quantidade de banheiros como 1
        And eu insiro a localização como "Rua Exemplo, 123, Cidade Exemplo"
        And eu insiro o preço por noite como '$' 150
        And eu não adiciono fotos da acomodação
        And eu confirmo a publicação
        Then eu devo ver uma mensagem de erro indicando que ao menos uma foto é obrigatória
        And a acomodação não deve ser publicada

    Scenario: Cancelar publicação da acomodação
        Given que eu sou um usuário autenticado
        When eu acesso a opção de publicar acomodação
        And eu insiro a quantidade de quartos como 2
        And eu insiro a quantidade máxima de hóspedes como 4
        And eu insiro a quantidade de banheiros como 1
        And eu insiro a localização como "Rua Exemplo, 123, Cidade Exemplo"
        And eu insiro o preço por noite como 150
        And eu adiciono fotos da acomodação
        And eu decido cancelar a publicação
        Then a acomodação não deve ser publicada
        And os dados inseridos não devem ser salvos

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

    Scenario: Editar o tipo de quarto
        Given que eu tenho uma reserva confirmada
        When eu acesso a opção de editar reserva
        And eu altero o 'tipo de quarto' para 'duplo'
        And eu confirmo a alteração
        Then o tipo de quarto na minha reserva deve ser atualizado para duplo

    Scenario: Cancelar a reserva
        Given que eu tenho uma reserva confirmada
        When eu acesso a opção de cancelar reserva
        And eu confirmo o cancelamento
        Then minha reserva deve ser cancelada
        And eu devo receber uma confirmação de cancelamento



    # Funcionalidade: Busca de Reservas
    Scenario: Busca inicial baseada em Lugar, período de estadia, Quantidade de Adultos e Crianças
        Given Usuário "felipedurant" com data de nascimento "25/08/1998", celular "81992926644"
        e senha "felipe" está logado e na home
        When Usuário insere "Praia dos Carneiros" no Lugar que deseja hospedagem
        And insere data de check-in "25/08/2024" e data de check-out "28/08/2024"
        And e insere que os hóspedes serão "2" adultos e "1" criança
        And insere "2" na quantidade de quartos
        Then Usuário é redirecionado até página de procura que contém hospedagem "KM Hostel"
        And Preço "350" é mostrado pelo custo de "2" diárias

# Funcionalidade: Salvar, Gostar e Compartilhar

Feature: Pagamento

Cuida da parte de pagamentos e promoções

# Funcionalidade: Cadastro e Manutenção de Métodos de Pagamento

# Funcionalidade: Cadastro e Manutenção de Promoções

# Funcionalidade: Disparo de Email com comprovante do pedido






