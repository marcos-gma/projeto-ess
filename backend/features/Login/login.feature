Feature: Login de Usuário
    
    Scenario: Login bem sucedido
        Given um usuário “José Maria” que está cadastrado no sistema 
        When “José Maria” preenche os dados “Email” : “email”, “password” : “JS1234”  e confirma
        Then uma requisição POST é enviada ao sistema
        Then o sistema confirma a requisição
        Then o usuário “José Maria” está logado 
    
    Scenario: Informações faltantes/erradas no login
        Given um usuário “José Maria” que não está cadastrado no sistema 
        When “José Maria” preenche os dados “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirma
        Then uma requisição POST é enviada ao sistema
        Then o sistema manda uma mensagem de erro
        Then o usuário “José Maria” não está logado 


