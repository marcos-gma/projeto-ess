import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ListarPromo from '../../services/promo/listarPromo.js';
import NavBar from '../Compartilhado/navbar.js';
import './style.css';

const ActivePromosPage = () => {
  const [promos, setPromos] = useState([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const data = await ListarPromo();
        console.log('Fetched data:', data); // Adicione isto para ver o formato dos dados
        if (Array.isArray(data)) {
          setPromos(data);
        } else {
          console.error('Expected an array but got:', data);
          setPromos([]);
        }
      } catch (error) {
        console.error('Error fetching promotions:', error);
        setPromos([]);
      }
    }
    fetchData();
  }, []);
  
  return (
    <div>
      <NavBar />
      <div className="main">
        <h1>Active Promos Page</h1>
        <p>Welcome to the Active Promos Page!</p>

        <div className="promo-list">
          {promos.length === 0 ? (
            <p>No promotions available.</p>
          ) : (
            promos.map((promo) => (
              <div key={promo.promoId} className="promo-card">
                <h2>{promo.promoName}</h2>
                <p>{promo.desconto}</p>
                <p>{promo.data_inicio}</p>
                <p>{promo.data_fim}</p>
                <Link to={`/promo/${promo.promoId}`}>Ver detalhes</Link>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  );
};

export default ActivePromosPage;
