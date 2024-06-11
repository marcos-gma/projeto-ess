Feature: Cadastro E Login de usuário

Como um usuário comum
Eu quero me cadastrar
Para que eu possa fazer o login

GUI:
    Scenario: Cadastro bem sucedido
        Given eu sou um novo usuário “José Maria” na página “Intro” 
        Then eu sigo para a página “Cadastrar-se”
        When eu preencho os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01/1901”, “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirmo 
        Then eu recebo a mensagem de confirmação do cadastro
        Then eu retorno para a página “Intro”

    Scenario: Usuário já cadastrado
        Given eu sou um usuário “José Maria” já cadastrado na página “Intro”
        Then eu sigo para a página “Cadastrar-se”
       When eu preencho os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01/1901”, “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirmo 
        Then eu recebo uma mensagem de “Usuário já cadastrado”
        Then eu continuo na página “Cadastrar-se”

    Scenario: Informações em falta no cadastro
        Given eu sou um usuário “José Maria” na página “Intro” 
        Then eu sigo para a página “Cadastrar-se”
        When eu preencho os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01/1901”, “Email” : “”, “Senha” : “JS1234”   e confirmo 
        Then eu recebo uma mensagem que pede para colocar todas as informações necessárias
        Then eu continuo na página “Cadastrar-se”

    Scenario: Informações incorretas no cadastro
        Given eu sou um usuário “José Maria” na página “Intro”  
        Then eu sigo para a página “Cadastrar-se”
        When eu preencho os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01”, “Email” : “JSEMAIL”, “Senha” : “JS1234” e confirmo  
        Then eu recebo uma mensagem que pede para preencher as informações corretamente
        Then eu continuo na página “Cadastrar-se”
    
    Scenario: Login bem sucedido
        Given eu sou um usuário “José Maria” já cadastrado na página “Intro”
        Then eu sigo para a página “Entrar”
        When eu preencho os dados “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirmo  
        Then eu estou logado 
        Then eu sigo para a página “Home”
    
    Scenario: Informações erradas ao tentar entrar
        Given eu sou um usuário “José Maria” na página “Intro”
        Then eu sigo para a página “Entrar”
         When eu preencho os dados “Email” : “JS@EMAIL.com”, “Senha” : “JS14”  e confirmo
        Then eu recebo uma mensagem que alega Senha ou Email incorretos
        Then eu não estou logado  
        Then eu continuo na página “Entrar”
    
SERVICE: 
    Scenario: Cadastro bem sucedido
        Given um usuário “José Maria” que não está cadastrado no sistema 
        When “José Maria” preenche os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01/1901”, “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirma 
        Then uma requisição POST é enviada ao sistema
        Then o sistema confirma a requisição
        Then o usuário “José Maria” é registrado no sistema

    Scenario: Already Registered User
        Given um usuário “José Maria” que está cadastrado no sistema
        When “José Maria” preenche os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01/1901”, “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirma   
        Then uma requisição POST é enviada ao sistema
        Then o sistema manda uma mensagem de erro
        Then o usuário "José Maria" permanece cadastrado no sistema
    
    Scenario: Informações faltantes/erradas no cadastro 
        Given um usuário “José Maria” que não está cadastrado no sistema
        When “José Maria” preenche os dados “Nome” : “José Maria”, “Data de Nascimento” : “01/01”, “Email” : “JSEMAIL”, “Senha” : “JS1234”  e confirma  
        Then uma requisição POST é enviada ao sistema
        Then o sistema manda uma mensagem de erro
        Then o usuário “José Maria” não está registrado no sistema
    
    Scenario: Login bem sucedido
        Given um usuário “José Maria” que está cadastrado no sistema 
        When “José Maria” preenche os dados “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirma
        Then uma requisição POST é enviada ao sistema
        Then o sistema confirma a requisição
        Then o usuário “José Maria” está logado 
    
    Scenario: Informações faltantes/erradas no login
        Given um usuário “José Maria” que não está cadastrado no sistema 
        When “José Maria” preenche os dados “Email” : “JS@EMAIL.com”, “Senha” : “JS1234”  e confirma
        Then uma requisição POST é enviada ao sistema
        Then o sistema manda uma mensagem de erro
        Then o usuário “José Maria” não está registrado no sistema


