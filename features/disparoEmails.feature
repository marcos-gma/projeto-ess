Feature: Disparo de Emails

Como um usuário
Eu quero receber o detalhamento da reserva por Email
Para que eu possa assegurar os detalhes de maneira sucinta além da plataforma

GUI: 
    Scenario: Envio de email
        Given estou logado como usuário “José Maria”
        And eu estou na página de confirmação de reserva
        When eu confirmo minha reserva 
        Then eu recebo uma mensagem de confirmação
        Then eu recebo um email com todas as informações da reserva
        Then eu retorno para a página “Home”


Service:
    Scenario: Envio de email
        Given um usuário “José Maria” está logado
        And o usuário “José Maria” está na página de confirmação de reserva
        When o usuário “José Maria” confirma a sua reserva
        Then uma requisição GET é enviada ao sistema 
        Then o sistema confirma a requisição      
        Then um Email é enviado com os dados fornecidos pelo sistema para “José Maria”

     ##teste 