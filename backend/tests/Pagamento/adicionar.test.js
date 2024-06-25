import { defineFeature, loadFeature } from 'jest-cucumber';
import supertest from 'supertest';
import app from '../..';
import fs from 'fs';
import path from 'path';

const feature = loadFeature('./features/Pagamento/adicionar.feature');
const request = supertest(app);

defineFeature(feature, test => {
    test('Adicionar novo método de pagamento com sucesso', ({ given, and, when, then }) => {
        let response;
        given(/^o usuário com e-mail "(.*)" está cadastrado no sistema$/, (email) => {

        });

        and(/^não há o cartão com cardNumber "(.*)" e type "(.*)" registrado no seu cadastro$/, (cardNumber, type) => {

        });

        when(/^uma nova requisição POST é feita para o endpoint "(.*)" com email: "(.*)", cardNumber: "(.*)", name: "(.*)", expireDate: "(.*)", type: "(.*)" e cvv: "(.*)"$/, async (endpoint, email, cardNumber, name, expireDate, type, cvv) => {
            //const url = endpoint;

            response = await request.post(endpoint).send({
                email, 
                cardNumber, 
                name, 
                expireDate, 
                type, 
                cvv
            });
        });

        then(/^o cartão com cardNumber "(.*)" e type "(.*)" é registrado no seu cadastro$/, (cardNumber, type) => {
            const { cardNumber_, type_ } = response.body;

            expect(cardNumber).toBe(cardNumber);
            expect(type).toBe(type);
        });

        and(/^o código de resposta é "(.*)"$/, (anscode) => {
            expect(response.status).toBe(anscode);
        });
    });
});
