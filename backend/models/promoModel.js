// cria o modelo de promoção com as variáveis necessárias
// informações para criação de uma promoção: nomeProp, desconto, promoName, data_inicio, data_fim

const promoDb = require('./promoDb.js'); // importa o banco de dados 
const { v4: uuidv4 } = require('uuid'); // gera id único

// define o que tem em uma promoção
class Promo {
    constructor(nomeProp, desconto, promoName, data_inicio, data_fim) {
        this.promoId = uuidv4(); 
        this.nomeProp = nomeProp;
        this.desconto = desconto;
        this.promoName = promo  Name;
        this.data_inicio = data_inicio;
        this.data_fim = data_fim;
    }

    validateDiscount() {
        return this.desconto > 0 && this.desconto <= 100; // retorna true se o desconto for entre 1 e 100%
    }

}

// exporta a classe Promo
module.exports = Promo