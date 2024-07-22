import React, { useState, useEffect } from 'react';
import Visualizar from '../../services/pagamento/visualizar.js';
import NavBar from './../Compartilhado/navbar.js';
import './style.css';

const PagamentoPage = () => {
  const [cards, setCards] = useState([]);

  useEffect(() => {
    const fetchUserCards = async () => {
      try {
        const email = 'iasmin@protonmail.com'; // Substitua pelo email do usuário real
        const data = await Visualizar(email);
        console.log('Fetched data: ', data);
        if (Array.isArray(data)) {
          setCards(data);
        } else {
          console.error('Expected an array but got: ', data);
          setCards([]);
        }
      } catch (error) {
        console.error('Error fetching user cards:', error);
        setCards([]);
      }
    };
    fetchUserCards();
  }, []);

  return (
    <div>
      <NavBar />
      <div className='main'>
        <h2>Pagamento Page</h2>
        <p>Welcome to the Pagamento Page</p>

        <div>
          <h3>Seus Cartões:</h3>
          <ul>
            {cards.map((card, index) => (
              <li key={index}>
                <p>Número do Cartão: {card.cardNumber}</p>
                <p>Tipo: {card.type}</p>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default PagamentoPage;
