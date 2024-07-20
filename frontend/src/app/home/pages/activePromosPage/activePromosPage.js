import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import ListarPromo from '../../services/promo/listarPromo.js'
import NavBar from '../Compartilhado/navbar.js'
import './style.css'


const AllInfo = () => {
  // puxar o banco de dados com o listarPromo e o useEffect
  const [promos, setPromos] = useState([])
  
  useEffect(() => {
    async function fetchData() {
      try {
        const promos = await ListarPromo();
        setPromos(Array.isArray(promos) ? promos : []);
      } catch (error) {
        console.error('Erro encontrado: ', error);
        setPromos([]);
      }
    }
    fetchData();
  }, []);

  return (
    <div className='promo-list'>
      {promos.length === 0 ? (
        <p>No promotions available.</p>
      ) : (
        promos.map((promo, index) => (
          <div key={index} className='promo-card'>
            <h2>{promo.promoName}</h2>
            <h3>{promo.promoId}</h3>
            <p>{promo.desconto}</p>
            <p>{promo.data_inicio}</p>
            <p>{promo.data_fim}</p>
            <Link to={`/promo/${promo.id}`}>Ver detalhes</Link>
          </div>
        ))
      )}
    </div>
  );
};

const ActivePromosPage = () => {
  return (
      <div>
        <NavBar />
        <div className='main'>
          <h1>Active Promos Page</h1>
          <p>Welcome to the Active Promos Page!</p>
          <AllInfo />
        </div>
      </div>
    )
  }

  export default ActivePromosPage