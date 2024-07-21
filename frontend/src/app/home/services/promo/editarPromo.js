import api from '../api.js';

const editarPromo = async (id, data) => {
    try {
        const response = await api.put(`/promo/editar_promocao/${id}`, data);
        return response.data;
    } catch (error) {
        console.error('Erro ao editar promoção:', error);
        throw error;
    }
};

export default editarPromo;
