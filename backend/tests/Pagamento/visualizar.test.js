import { defineFeature, loadFeature } from 'jest-cucumber';
import supertest from 'supertest';
import app from '../..';
import fs from 'fs';
import path from 'path';

const feature = loadFeature('./features/Pagamento/visualizar.feature');
const request = supertest(app);

defineFeature(feature, test => {
    test('Visualizar métodos de pagamento quando existem', ({ given, and, when, then }) => {
        let response;
        given(/^o usuário com e-mail "(.*)" está cadastrado no sistema$/, (email) => {

        });

        and(/^o cartão com cardNumber "(.*)" e type "(.*)" está registrado no seu cadastro$/, (cardNumber, type) => {

        });

        when(/^uma nova requisição GET é feita com e-mail "(.*)"$/, async (email) => {
            const url = "/pagamento/visualize";

            response = await request.get(url).send({
                email: email
            })
        });

        then(/^o sistema retorna o cartão com cardNumber "(.*)" e type "(.*)"$/, (cardNumber, type) => {
            
        });

        and(/^o código de resposta é "(.*)"$/, (anscode) => {
            expect(response.status).toBe(200);
        });
    });
});