// aqui vai ser onde o usuário vai ver as promoções que ele criou, criar outras, editar e deletar
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ListarPromo from '../../../services/promo/listarPromo.js';
import NavBar from '../../Compartilhado/navbar.js';
import PopUp from '../../Compartilhado/popUp.js';
import ModalContent_CadastrarPromo from './modalCadastrar.js';


const MyPromos = () => {
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
        <h1>My Promos Page</h1>
        <p>Criar, editar e deletar promoções</p>

        <div className="promo-list">
          {promos.length === 0 ? (
            <p>No promotions available.</p>
          ) : (
            promos.map((promo) => (
              <div key={promo.promoId} className="promo-card">
                <br></br>
                <img src='https://www.blumarturismo.com.br/blog/wp-content/uploads/2022/11/1.jpg-1-840x500.png' alt='Hotel exemplo' />
                <h3>{promo.promoName}</h3>
                <p>Propriedade: {promo.nome}</p>
                <p>ID: {promo.id}</p>
                <p>Desconto: {promo.desconto}</p>
                <p>Início: {promo.data_inicio}</p>
                <p>Fim: {promo.data_fim}</p>
                <Link to={`/promo/${promo.promoId}`}>Ver detalhes</Link>
              </div>
            ))
          )}
        </div>
        <PopUp title="Cadastrar Nova Promoção">
          <ModalContent_CadastrarPromo />
        </PopUp>
      </div>
    </div>
  );
};

export default MyPromos;
