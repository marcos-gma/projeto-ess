// aqui vai ser onde o usuário vai ver as promoções que ele criou, criar outras, editar e deletar
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ListarPromo from '../../../services/promo/listarPromo.js';
import Button from '../../Compartilhado/button.js';
import NavBar from '../../Compartilhado/navbar.js';
import PopUp from '../../Compartilhado/popUp.js';

const ModalContent = () => {
    return (
        <div>
            <h1>Cadastrar Nova Promoção</h1>
            <form>
                <label>
                    Nome da Promoção:
                    <input type="text" name="promoName"  required/>
                </label>
                <br />
                <label>
                    Nome do Hotel:
                    <input type="text" name="nome" required />
                </label>
                <br />
                <label>
                    Desconto:
                    <input type="number" name="desconto" required/>
                </label>
                <br />
                <label>
                    Data de Início:
                    <input type="date" name="data_inicio" required/>
                </label>
                <br />
                <label>
                    Data de Fim:
                    <input type="date" name="data_fim" required/>
                </label>
                <br />
                <Button nome="Finalizar e Criar" destino="/my-promos" />
            </form>
        </div>
    );
}


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
                <p>{promo.nome}</p>
                <p>{promo.desconto}</p>
                <p>{promo.data_inicio}</p>
                <p>{promo.data_fim}</p>
                <Link to={`/promo/${promo.promoId}`}>Ver detalhes</Link>
              </div>
            ))
          )}
        </div>
        <PopUp title="Cadastrar Nova Promoção">
          <ModalContent />
        </PopUp>
      </div>
    </div>
  );
};

export default MyPromos;
