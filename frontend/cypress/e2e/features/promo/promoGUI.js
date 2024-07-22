// aqui é onde vão os testes de verdades, lidos pelo cypress
// não diferenciar por scenarios, mas cada linha deve ser uma função livre
// associada ao arquivo promoGUI.feature

// Scenario: Cadastrar uma promoção com sucesso
Given('Eu estou na página {string}', (page) => {
    cy.visit(page);
});

When ('Eu clico no botão {string}', (buttonName) => {
    cy.get('button').contains(buttonName).click();
});

Then ('O modal de cadastro de promoção é aberto', () => {
    cy.get('[data-testid=modal]').should('be.visible');
});

And ('Eu preencho o campo ID do Hotel com {string}, o campor Desconto com {string}, o campo Nome da Promoção com {string}, o campo Data de Início com {string}, o campo Data de Fim com {string}', (id, desconto, promoName, data_inicio, data_fim) => {
    cy.get('input[name=id]').type(id);
    cy.get('input[name=desconto]').type(desconto);
    cy.get('input[name=promoName]').type(promoName);
    cy.get('input[name=data_inicio]').type(data_inicio);
    cy.get('input[name=data_fim]').type(data_fim);
});

When ('Eu clico no botão {string}', (buttonName) => {
    cy.get('button').contains(buttonName).click();
});

Then ('Eu vejo a mensagem {string}', (message) => {
    cy.contains(message).should('be.visible');
});

Then ('O modal de cadastro de promoção é fechado', () => {
    cy.get('[data-testid=modal]').should('not.be.visible');
});

Then ('Eu vejo a promoção {string} na lista de promoções', (promoName) => {
    cy.contains(promoName).should('be.visible');
});



