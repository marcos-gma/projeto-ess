import React from 'react';
import './styleCard.css'; 
import MoradaDoMar from '../../assets/MoradaDoMar.png';
import PousadaMaresia from '../../assets/PousadaMaresia.jpg';
import Recanto from '../../assets/Recanto.jpeg';
import Paraiso from '../../assets/Paraiso.jpg';
import LarDoceLar from '../../assets/LarDoceLar.jpg';
import Naiepe from '../../assets/PousadaNaiepe.jpg';

const HotelCard = ({ hotel }) => {
  if (!hotel) {
    return <div>Invalid hotel data</div>;
  }

  let image;
  if (hotel.name === 'Morada do Mar') {
    image = MoradaDoMar
  } else if (hotel.name == 'Pousada Maresia') {
    image = PousadaMaresia
  } else if (hotel.name == 'Hotel Paraíso') {
    image = Paraiso
  } else if (hotel.name == 'Lar Doce Lar') {
    image = LarDoceLar
  } else if (hotel.name == 'Recanto dos Corais') {
    image = Recanto
  } else if (hotel.name == 'Pousada Naiepe') {
    image = Naiepe
  }

  return (
    <div className="hotel-card">
      <img className="hotel-card-image" src={image} alt='Hotel exemplo' />
      <div className="hotel-card-content">
        <h2 className="hotel-card-name">{hotel.name || 'No name available'}</h2>
        <p className="hotel-card-price">{hotel.price ? `R$${hotel.price}` : 'No price available'}</p>
      </div>
    </div>
  );
};

export default HotelCard;
