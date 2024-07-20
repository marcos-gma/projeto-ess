import api from "../api";

export default async function cadastrarPromo(id, desconto, promoName, data_inicio, data_fim) {
    try {
        const data = {
            id: id,
            desconto: desconto,
            promoName: promoName,
            data_inicio: data_inicio,
            data_fim: data_fim
        };
        const response = await api.post('/promos/cadastrar_promo', data);
        return response.data;
    } catch (error) {
        console.error(error);
        return [];
    }
}