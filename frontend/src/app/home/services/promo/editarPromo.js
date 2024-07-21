import api from "../api.js";

export default async function editarPromo(id, desconto, promoName, data_inicio, data_fim) {
    try {
        const data = {
            id: id,
            desconto: desconto,
            promoName: promoName,
            data_inicio: data_inicio,
            data_fim: data_fim
        };
        const response = await api.put(`/promo/editar_promocao/${id}`, data);
        return response.data;
    } catch (error) {
        console.error(error);
        return [];
    }
}