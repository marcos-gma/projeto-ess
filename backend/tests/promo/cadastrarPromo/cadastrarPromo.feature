Feature: Cadastro promoção
    As a administrador do sistema 
    I want to ser capaz de cadastrar uma nova promoção 
    So that o usuário possa fazer reservas com valores promocionais
    
    Scenario: Cadastro com sucesso de nova promoção
        Given o administrador "João" deseja cadastrar uma nova promoção
        And somente a acomodação "Apartamento Central" está cadastrada no endpoint "/accommodation.json" com o corpo:
        """
        {
            "id": "2",
            "nome": "Apartamento Central",
            "quantidadeQuartos": 2,
            "lotacaoMaxima": 4,
            "precoPorNoite": 200,
            "userId": "123"
        }
        """
        When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
        """
            {
                "id": 2,
                "desconto": 50,
                "promoName": "Promoção metade",
                "data_inicio": "2021-10-01",
                "data_fim": "2021-10-31"
            }
        """
        Then o sistema retorna o código de resposta "200" # created
        And o sistema retorna a mensagem com o corpo:
        """
        {
            "message": "Promo created successfully."
        }
        """
        And o endpoint "/accommodation.json" possui o corpo:
        """
            {
                "id": "2",
                "nome": "Apartamento Central",
                "quantidadeQuartos": 2,
                "lotacaoMaxima": 4,
                "precoPorNoite": 100,
                "userId": "123",
                "desconto": 50,
                "promoName": "Promoção metade",
                "promoId": "29274b23-eb99-4410-b82e-3b141d986133",
                "data_inicio": "2021-10-01",
                "data_fim": "2021-10-31"
            }
        """

    Scenario: Cadastro falho de nova promoção devido à ausência de acomodação cadastrada
        Given o administrador "João" deseja cadastrar uma nova promoção
        And somente a acomodação "Apartamento Central" está cadastrada no endpoint "/accommodation.json" com o corpo:
        """
        {
            "id": "3",
            "nome": "Apartamento Central",
            "quantidadeQuartos": 2,
            "lotacaoMaxima": 4,
            "precoPorNoite": 200,
            "userId": "123"
        } 
        """
        When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
        """
        {
            "id": 5,
            "desconto": 50,
            "promoName": "Promoção metade",
            "data_inicio": "2021-10-01",
            "data_fim": "2021-10-31"
        }
        """
        Then o sistema retorna o código de resposta "404" # not found
        And o sistema retorna uma mensagem de erro indicando o a ausência da acomodação com id == "5":
        """
        {
            "error": "Hotel not found."
        }
        """

    Scenario: Cadastro falho de nova promoção devido à ausência de informações
        Given o administrador "João" deseja cadastrar uma nova promoção
        And somente a acomodação "Apartamento Central" está cadastrada no endpoint "/accommodation.json" com o corpo:
        """
        {
            "id": "3",
            "nome": "Apartamento Central",
            "quantidadeQuartos": 2,
            "lotacaoMaxima": 4,
            "precoPorNoite": 200,
            "userId": "123"
        }
        """
        When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
        """
        {
            "id": 3,
            "desconto": 50,
            "promoName": "",
            "data_inicio": "2021-10-01",
            "data_fim": "2021-10-31"
        }
        """
        Then o sistema retorna o código de resposta "400" # bad request
        And o sistema retorna uma mensagem de erro indicando o mal preenchimento dos campos:
        """
        {
            "error": "All fields are required."
        }
        """

    Scenario: Cadastro falho de nova promoção devido ao preenchimento inadequado do campo "desconto"
        Given o administrador "João" deseja cadastrar uma nova promoção
        And somente a acomodação "Apartamento Central" está cadastrada no endpoint "/accommodation.json" com o corpo:
        """
        {
            "id": "2",
            "nome": "Apartamento Central",
            "quantidadeQuartos": 2,
            "lotacaoMaxima": 4,
            "precoPorNoite": 200,
            "userId": "123"
        } 
        """
        When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
        """
        {
            "id": 2,
            "desconto": 150,
            "promoName": "Black Friday",
            "data_inicio": "2021-10-01",
            "data_fim": "2021-10-31"
        } 
        """
        Then o sistema retorna o código de resposta "400" # bad request
        And o sistema retorna uma mensagem de erro indicando o mal preenchimento dos campos:
        """
        {
            "error": "Invalid discount. It should be between 1 and 100"
        }
        """

    Scenario: Cadastro falho de nova promoção devido ao preenchimento inadequado do campo "data_inicio" e "data_fim"
        Given o administrador "João" deseja cadastrar uma nova promoção
        And somente a acomodação "Apartamento Central" está cadastrada no endpoint "/accommodation.json" com o corpo:
        """
        {
            "id": "2",
            "nome": "Apartamento Central",
            "quantidadeQuartos": 2,
            "lotacaoMaxima": 4,
            "precoPorNoite": 200,
            "userId": "123"
        }
        """
        When "João" faz uma requisição POST para o endpoint "/cadastrar_promocao" com o corpo:
        """
        {
            "id": 2,
            "desconto": 50,
            "promoName": "Black Friday",
            "data_inicio": "2021-11-01",
            "data_fim": "2021-10-31"
        }
        """
        Then o sistema retorna o código de resposta "400" # bad request
        And o sistema retorna uma mensagem de erro indicando o mal preenchimento dos campos:
        """
        {
            "error": "Invalid date. Final date should be after the beginning promotion date."
        }
        """
