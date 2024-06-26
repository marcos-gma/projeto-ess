import { defineFeature, loadFeature } from 'jest-cucumber';
import supertest from 'supertest';
import app from '../..';
import fs from 'fs';
import path from 'path';

const feature = loadFeature('./features/Pagamento/remover.feature');
const request = supertest(app);

defineFeature(feature, test => {
    test('Remover método de pagamento', ({ given, and, when, then }) => {
        let response;
        given(/^o usuário com e-mail "(.*)" está cadastrado no sistema$/, (email) => {

        });

        and(/^o cartão com cardNumber "(.*)" e type "(.*)" está registrado no seu cadastro$/, (cardNumber, type) => {

        });

        when(/^uma nova requisição DELETE é feita com email: "(.*)", cardNumber: "(.*)" e type: "(.*)"$/, async (email, cardNumber, type) => {
            const url = '/pagamento/remove';

            response = await request.delete(url).send({
                email: email,
                cardNumber: cardNumber,
                type: type
            })
        });

        then('o cartão é removido do seu cadastro', () => {

        });

        and(/^o código de resposta é "(.*)"$/, (anscode) => {
            expect(response.status).toBe(204);
        });
    });
});
