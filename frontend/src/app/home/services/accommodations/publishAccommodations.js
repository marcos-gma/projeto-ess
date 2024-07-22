import api from '../api.js';

export default async function publishAccommodation(data) {
    try {
        const response = await api.post('user/host/accommodations/', data);
        return response.data;
    } catch (error) {
        console.error('Error publishing accommodation:', error);
        return 'Erro ao publicar acomodação';
    }
}