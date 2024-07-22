import React, { useEffect, useState } from 'react';
import { list } from '../../services/accommodations/list.js';

const AccommodationsList = () => {
    const [accommodations, setAccommodations] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchAccommodations = async () => {
            try {
                const data = await list();
                setAccommodations(data);
                setLoading(false);
            } catch (error) {
                setError(error.message);
                setLoading(false);
            }
        };

        fetchAccommodations();
    }, []);

    if (loading) {
        return <div>Loading...</div>;
    }

    if (error) {
        return <div>Error: {error}</div>;
    }

    return (
        <div>
            <h1>Accommodations List</h1>
            <ul>
                {accommodations.map(accommodation => (
                    <li key={accommodation.id}>
                        <h2>{accommodation.nome}</h2>
                        <p>Quantidade de Quartos: {accommodation.quantidadeQuartos}</p>
                        <p>Lotação Máxima: {accommodation.lotacaoMaxima}</p>
                        <p>Preço por Noite: ${accommodation.precoPorNoite}</p>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default AccommodationsList;
