import api from "../api";

export default async function listarPromo() {
    try {
        const response = await api.get('/promos/promocoes_cadastradas');
        return response.data;
    } catch (error) {
        console.error(error);
        return [];
    }
}