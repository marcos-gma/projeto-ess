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
