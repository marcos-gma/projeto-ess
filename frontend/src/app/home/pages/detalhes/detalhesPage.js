import React from 'react';
import { useParams } from 'react-router-dom';
import NavBar from '../Compartilhado/navbar.js';

const hotels = [
  {
    "id": "2",
    "name": "Morada do Mar",
    "location": "Fernando de Noronha",
    "availableRooms": 1,
    "petFriendly": false,
    "accessibility": true,
    "rating": 3,
    "rooms": [
      {
        "beds": 2,
        "price": 1000,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      }
    ]
  },
  {
    "id": "1",
    "name": "Pousada Maresia",
    "location": "Fernando de Noronha",
    "availableRooms": 1,
    "petFriendly": true,
    "accessibility": false,
    "rating": 4,
    "rooms": [
      {
        "beds": 2,
        "price": 1500,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      }
    ]
  },
  {
    "id": "3",
    "name": "Hotel Paraíso",
    "location": "Fernando de Noronha",
    "availableRooms": 3,
    "petFriendly": true,
    "accessibility": true,
    "rating": 5,
    "rooms": [
      {
        "beds": 2,
        "price": 3000,
        "freeDates": [
          "21/05/2024",
          "24/05/2024",
          "25/05/2024"
        ]
      },
      {
        "beds": 1,
        "price": 1500,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      },
      {
        "beds": 3,
        "price": 4000,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      }
    ]
  },
  {
    "id": "4",
    "name": "Lar Doce Lar",
    "location": "Fernando de Noronha",
    "availableRooms": 1,
    "petFriendly": false,
    "accessibility": false,
    "rating": 2,
    "rooms": [
      {
        "beds": 2,
        "price": 800,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      }
    ]
  },
  {
    "id": "5",
    "name": "Recanto dos Corais",
    "location": "Fernando de Noronha",
    "availableRooms": 2,
    "petFriendly": true,
    "accessibility": true,
    "rating": 4,
    "rooms": [
      {
        "beds": 2,
        "price": 1800,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      },
      {
        "beds": 1,
        "price": 900,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      }
    ]
  },
  {
    "id": "6",
    "name": "Pousada Naiepe",
    "location": "Fernando de Noronha",
    "availableRooms": 1,
    "petFriendly": false,
    "accessibility": true,
    "rating": 2,
    "rooms": [
      {
        "beds": 2,
        "price": 750,
        "freeDates": [
          "21/05/2024",
          "24/05/2024"
        ]
      }
    ]
  }
];

const Detalhes = () => {
  const name = localStorage.getItem("hotel");
  const hotel = hotels.find((hotel) => hotel.name === name);
  console.log(name);

  return (
    <div>
      <NavBar />
      <h1>Detalhes do Hotel</h1>
      {hotel ? (
        <div>
          <h2>{hotel.name}</h2>
          <p>Localização: {hotel.location}</p>
          <p>Quartos disponíveis: {hotel.availableRooms}</p>
          <p>Aceita animais: {hotel.petFriendly ? 'Sim' : 'Não '}</p>
          <p>Acessibilidade: {hotel.accessibility ? 'Sim' : 'Não'}</p>
          <p>Classificação: {hotel.rating} estrelas</p>
          <h3>Quartos:</h3>
          {hotel.rooms.map((room, index) => (
            <div key={index}>
              <p>Camas: {room.beds}</p>
              <p>Preço: {room.price}</p>
              <p>Datas livres: {room.freeDates.join(', ')}</p>
            </div>
          ))}
        </div>
      ) : (
        <p>{name}</p>
      )}
    </div>
  );
};

export default Detalhes;