import fs from 'fs';
import path from 'path';

import { v4 as uuidv4 } from 'uuid';

function withDiscount(hotel, desconto) {
    return (desconto / 100) * hotel.valor; // retorna o novo valor com base no desconto
}

function noDiscount(hotel) {
    // se o desconto era de 10%, e o valor q tá lá eh 90, o valor original era 100 -> retorna 100
    return (hotel.valor * 100) / (100 - hotel.desconto); // retorna o valor original com base no desconto
}

function validateDate(data_inicio, data_fim) {
    return data_inicio < data_fim; // retorna true se a data de início for menor que a data de fim
}

function validateDiscount(desconto) {
    return desconto > 0 && desconto <= 100; // retorna true se o desconto for entre 1 e 100%
}

var data = JSON.parse(fs.readFileSync(path.resolve('./samples/hotels.json'), 'utf8'))


// criar promoção
export const createPromo = (req, res) => {
    try {
        const { idHotel, desconto, promoName, promoId, data_inicio, data_fim } = req.body; // pega os dados da requisição
        const hotelIndex = data.findIndex(hotel => hotel.idHotel === idHotel); // encontra o hotel pelo id
        
        if (hotelIndex === -1) { // verifica se o hotel existe
            return res.status(404).json({ error: 'Hotel not found.' });
        }

        const hotel = data[hotelIndex]; // obtém o hotel encontrado
        if (!validateDiscount(desconto)) { // verifica se o desconto é válido
            return res.status(400).json({ error: 'Invalid discount. It should be between 1 and 100' });
        }

        const newDiscountValue = withDiscount(hotel, desconto); // calcula o novo valor com base no desconto

        hotel.desconto = desconto;
        hotel.promoName = promoName;
        promoId ? hotel.promoId = promoId : hotel.promoId = uuidv4(); // gera um id único para a promoção
        
        if (!validateDate(data_inicio, data_fim)) { // verifica se a data de início é menor que a data de fim
            return res.status(400).json({ error: 'Invalid date.' });
        }
        hotel.data_inicio = data_inicio;
        hotel.data_fim = data_fim;

        hotel.valor = newDiscountValue; // atualiza o valor com o novo valor calculado
        data[hotelIndex] = hotel; // atualiza o hotel no banco de dados
        res.status(201).json(hotel); // retorna o hotel atualizado
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};

// listar promoções
export const listPromos = (req, res) => {
    try {
        const promos = data.filter(hotel => hotel.promoName); // filtra os hotéis que possuem promoção
        res.status(200).json(promos); // retorna todas as promoções
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};

// deletar promoção
export const deletePromo = (req, res) => {
    try {
        const { idHotel } = req.params; // pega o id do hotel
        const hotelIndex = data.findIndex(hotel => hotel.idHotel === idHotel); // encontra o hotel pelo id

        if (hotelIndex === -1) { // verifica se o hotel existe
            return res.status(404).json({ error: 'Hotel not found.' });
        }

        const hotel = data[hotelIndex]; // obtém o hotel encontrado
        delete hotel.desconto;
        delete hotel.promoName;
        delete hotel.data_inicio;
        delete hotel.data_fim;
        hotel.valor = noDiscount(hotel); 
        data[hotelIndex] = hotel; // atualiza o hotel no banco de dados
        res.status(200).json({ message: 'Promo deleted successfully.' });
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};

// editar promoção
export const editPromo = (req, res) => {
    try {
        const { idHotel } = req.params; // pega o id do hotel
        const { desconto, promoName, data_inicio, data_fim } = req.body; // pega os dados da requisição
        const hotelIndex = data.findIndex(hotel => hotel.idHotel === idHotel); // encontra o hotel pelo id

        if (hotelIndex === -1) { // verifica se o hotel existe
            return res.status(404).json({ error: 'Hotel not found.' });
        }

        const hotel = data[hotelIndex]; // obtém o hotel encontrado

        if (!validateDiscount(desconto)) { 
            return res.status(400).json({ error: 'Invalid discount. It should be between 1 and 100.' });
        }

        const newDiscountValue = withDiscount(hotel, desconto); 

        // atualiza os dados do hotel
        hotel.desconto = desconto;
        hotel.promoName = promoName;

        if (!validateDate(data_inicio, data_fim)) { 
            return res.status(400).json({ error: 'Invalid date. Final date should be after the beginning promotion date.' });
        }

        hotel.data_inicio = data_inicio;
        hotel.data_fim = data_fim;
        hotel.valor = newDiscountValue; 
        data[hotelIndex] = hotel; // atualiza o hotel no banco de dados
        res.status(200).json(hotel); // retorna o hotel atualizado
    
    } catch (error) {
        return res.status(400).send({ message: error.message });
    }
};