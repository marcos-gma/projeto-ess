// visualizar.js
import api from "../api.js";

export default async function Visualize(email) {
    try {
        const response = await api.get('/pagamento/visualize', {
            params: {
                email: email
            }
        });
        return response.data;
    } catch (error) {
        console.error('Error fetching user cards:', error);
        throw error; // ou tratar o erro conforme necessário
    }
}
