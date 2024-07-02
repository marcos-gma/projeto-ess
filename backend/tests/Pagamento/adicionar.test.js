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

        when(/^uma nova requisição POST é feita com e-mail: "(.*)", cardNumber: "(.*)", name: "(.*)", expireDate: "(.*)", type: "(.*)" e cvv: "(.*)"$/, async (endereco, cartao, nome, validade, tipo, seg) => {
            const url = '/pagamento/add';

            response = await request.post(url).send({
                email: endereco, 
                cardNumber: cartao, 
                name: nome, 
                expireDate: validade, 
                type: tipo, 
                cvv: seg
            });
        });

        then(/^o código de resposta é "(.*)"$/, (anscode) => {
            expect(response.status).toBe(201);
        });

        and(/^o cartão com cardNumber "(.*)" e type "(.*)" é registrado no seu cadastro$/, (cartao, tipo) => {
            const { cardNumber, type } = response.body;

            expect(cardNumber).toBe(cartao);
            expect(type).toBe(tipo);
        });
    });

    test('Adicionar novo método de pagamento sem sucesso', ({ given, and, when, then }) => {
        let response;

        given(/^o usuário com e-mail "(.*)" está cadastrado no sistema$/, (email) => {

        });

        and(/^não há o cartão com cardNumber "(.*)" e type "(.*)" registrado no seu cadastro$/, (cardNumber, type) => {

        });

        when(/^uma nova requisição POST é feita com e-mail: "(.*)", cardNumber: "(.*)", name: "(.*)", expireDate: "(.*)", type: "(.*)" e cvv: "(.*)"$/, async (email, cardNumber, name, expireDate, type, cvv) => {
            const url = '/pagamento/add';

            response = await request.post(url).send({
                email: email, 
                cardNumber: cardNumber, 
                name: name, 
                expireDate: expireDate, 
                type: type, 
                cvv: cvv
            });
        });

        then(/^o cartão com cardNumber "(.*)" e type "(.*)" não é registrado no seu cadastro$/, (cardNumber, type) => {

        });

        and(/^o código de resposta é "(.*)"$/, (anscode) => {
            expect(response.status).toBe(400);

        });
    });
});
