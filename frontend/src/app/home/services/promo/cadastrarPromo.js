import api from '../api.js';

export default async function CadastrarPromo(data) {
    try {
        const response = await api.post('/promo/cadastrar_promocao', data);
        return response.data;
    } catch (error) {
        console.error('Error creating promotion:', error);
        return 'Erro ao criar promoção';
    }
}
