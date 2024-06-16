// controller é uma aplicação web que aceita solicitações HTTP e gera respostas HTTP
// responsável por receber as requisições do cliente, processar e devolver uma resposta

// a ideia é gerenciar a lógica de negócios de cadastro, listagm, edição e exclusão de promoções

const Promo = require('../models/promoModel.js'); // importa o modelo de promoção
const promoDb = require('../samples/promoDb.js'); // importa o banco de dados de promoções

// criar promoção
exports.createPromo = (req, res) => {
    try {
        const { nomeProp, desconto, promoName, data_inicio, data_fim } = req.body; // pega os dados da requisição
        const newPromo = new Promo(nomeProp, desconto, promoName, data_inicio, data_fim); // cria uma nova promoção
        
        if (!newPromo.validateDiscount()) { // verifica se o desconto é válido
            return res.status(400).json({ error: 'Invalide discount. It should be between 1 and 100.' });
        }

        promoDb.push(newPromo); // adiciona a nova promoção ao banco de dados
        res.status(201).json(newPromo); // retorna a nova promoção
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};

// listar promoções
exports.listPromos = (req, res) => {
    res.status(200).json(promoDb); // retorna todas as promoções
};

// deletar promoção
exports.deletePromo = (req, res) => {
    try {
        const { promoId } = req.params; // pega o id da promoção
        const promoIndex = promoDb.findIndex(promo => promo.promoId === promoId); // encontra a promoção pelo id

        if (promoIndex === -1) { // verifica se a promoção existe
            return res.status(404).json({ error: 'Promo not found.' });
        }

        promoDb.splice(promoIndex, 1); // remove a promoção do banco de dados
        res.status(200).json({ message: 'Promo deleted sucessfully.' });    
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};

// editar promoção
exports.editPromo = (req, res) => {
    try {
        const { promoId } = req.params; // pega o id da promoção
        const { nomeProp, desconto, promoName, data_inicio, data_fim } = req.body; // pega os dados da requisição
        const promoIndex = promoDb.findIndex(promo => promo.promoId === promoId); // encontra a promoção pelo id

        if (promoIndex === -1) { // verifica se a promoção existe
            return res.status(404).json({ error: 'Promo not found.' });
        }

        promoDb[promoIndex] = { // edita a promoção substituindo os dados antigos pelos novos no index encontrado
            promoId,
            nomeProp,
            desconto,
            promoName,
            data_inicio,
            data_fim
        };

        res.status(200).json(promoDb[promoIndex]); // retorna a promoção editada
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};