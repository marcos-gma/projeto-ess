// o banco de dados é uma lista de dicionários
// cada dicionário é uma promoção

const { v4: uuidv4 } = require('uuid');

// exemplo de população de BD
const promoId1 = uuidv4();
const promoId2 = uuidv4();

let promoDb = [
    {
      id: promoId1,
      nomeProp: "Nome da Propriedade 1",
      desconto: 10,
      promoName: "Promoção 1",
      data_inicio: new Date("01/01/2022"),
      data_fim: new Date("01/31/2022")
      //   data_inicio: new Date("2022-01-01") -> menos propenso a erros de interpretação -> ver como o adm coloca
    },
    {
      id: promoId2,
      nomeProp: "Nome da Propriedade 2",
      desconto: 10,
      promoName: "Promoção 2",
      data_inicio: new Date("02/01/2022"),
      data_fim: new Date("02/28/2022")
    }
  ];
  
module.exports = promoDb;

// sobre o método Date do JavaScript
// let date1 = new Date("2022-01-01");
// let date2 = new Date("2022-02-01");

// console.log(date1 < date2); // true
// console.log(date1 > date2); // false
// console.log(date1 == date2); // false

// let date = new Date();
// console.log(date.getDate()); // Exibe o dia do mês
// console.log(date.getMonth()); // Exibe o mês (0-11, onde 0 é Janeiro)
// console.log(date.getFullYear()); // Exibe o ano

