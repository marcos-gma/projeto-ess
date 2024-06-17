Feature: Envio de email de confirmação de reserva

    Scenario: Envio de email
        Given um usuário “José Maria” está logado
        Then o usuário “José Maria” está na página de confirmação de reserva
        When o usuário “José Maria” confirma a sua reserva
        Then uma requisição GET é enviada ao sistema 
        Then o sistema confirma a requisição      
        Then um Email é enviado com os dados fornecidos pelo sistema para “José Maria”