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
    And eu insiro o preço por noite como '$150'
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
