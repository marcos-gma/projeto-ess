import { defineFeature, loadFeature } from  'jest-cucumber';
import supertest from 'supertest';
import app from '../..';
import fs from 'fs';
import path from 'path'

const feature = loadFeature('./tests/features/host/publishAccomodation.feature');
const request = supertest(app);

defineFeature(feature, test => {
  let response;
  let acomodacaoId;

  test('Publicar uma nova acomodação com sucesso', ({ given, when, and, then }) => {
    given(/^que estou na página "(.*)"$/, async (arg0) => {
      // Simular acesso à página de publicação de acomodação
    });

    when(/^preencho "Nome da acomodação" com "(.*)"$/, (nome) => {
      // Simular preenchimento do campo nome
      this.nome = nome;
    });

    and(/^preencho "Quantidade de quartos" com "(\d+)"$/, (quartos) => {
      // Simular preenchimento do campo quantidade de quartos
      this.quartos = quartos;
    });

    and(/^preencho "Lotação maxima" com "(\d+)"$/, (lotacaoMaxima) => {
      // Simular preenchimento do campo lotação máxima
      this.lotacaoMaxima = lotacaoMaxima;
    });

    and(/^preencho "Preço por noite" com "(\d+)"$/, (preco) => {
      // Simular preenchimento do campo preço por noite
      this.preco = preco;
    });

    and('clico no botão "Publicar"', async () => {
      // Simular requisição POST para publicar acomodação
      const novaAcomodacao = {
        nome: this.nome,
        quantidadeQuartos: this.quartos,
        lotacaoMaxima: this.lotacaoMaxima,
        precoPorNoite : this.preco
      };

      response = await request.post('http://localhost:5000/host/accommodations').send(novaAcomodacao);
      acomodacaoId = response.data.id;
    });

    then('a acomodação deve ser publicada com sucesso', () => {
      // Verificar se a acomodação foi publicada com sucesso
      expect(response.status).toBe(201);
    });

    and('devo ver o ID da nova acomodação', () => {
      // Verificar se o ID da nova acomodação foi retornado
      expect(acomodacaoId).toBeDefined();
    });
  });

  test('Tentar publicar uma acomodação com dados incompletos', ({ given, when, and, then }) => {
    given(/^que estou na página "(.*)"$/, async (arg0) => {
      // Simular acesso à página de publicação de acomodação
    });

    when(/^preencho "Nome da acomodação" com "(.*)"$/, (nome) => {
      // Simular preenchimento do campo nome
      this.nome = nome;
    });

    and(/^preencho "Quantidade de quartos" com "(\d+)"$/, (quartos) => {
      // Simular preenchimento do campo quantidade de quartos
      this.quartos = quartos;
    });

    and(/^preencho "Lotação maxima" com "(\d+)"$/, (lotacaoMaxima) => {
      // Simular preenchimento do campo lotação máxima
      this.lotacaoMaxima = lotacaoMaxima;
    });

    and(/^preencho "Preço por noite" com "(\d+)"$/, (preco) => {
      // Simular preenchimento do campo preço por noite
      this.preco = preco;
    });

    and('clico no botão "Publicar"', async () => {
      // Simular requisição POST para tentar publicar acomodação
      const novaAcomodacao = {
        nome: this.nome,
        quartos: this.quartos,
        lotacaoMaxima: this.lotacaoMaxima,
        preco: this.preco
      };

      try {
        response = await request.post('http://localhost:5000/host/accommodations').send(novaAcomodacao);
      } catch (error) {
        response = error.response;
      }
    });

    then(/^devo ver uma mensagem de erro "(.*)"$/, (mensagemErro) => {
      // Verificar se a mensagem de erro foi retornada
      expect(response.status).toBe(400);
      expect(response.data.error).toBe(mensagemErro);
    });
  });
});