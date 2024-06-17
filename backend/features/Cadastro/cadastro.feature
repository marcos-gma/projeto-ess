Feature: Cadastro de Usuário

    Scenario: Cadastro bem sucedido
        Given um usuário José Maria que não está cadastrado no sistema 
        When José Maria preenche os dados fullName : "José Maria", birthday : "01/01/1901", email : "JS@EMAIL.com", cellphone : "81912345678", password : "JS1234", confirmPassword : "JS1234" e confirma 
        Then o sistema confirma a requisição
        Then o usuário “José Maria” é registrado no sistema

    

