import React from 'react';
import HotelCard from './HotelCard';
import './styles.css';

const LikesPage = () => {
  const likes = [
    {
      id: 1,
      name: 'Pousada Maresia',
      price: 300,
    },
    {
      id: 2,
      name: 'Morada do Mar',
      price: 450,
    },
    {
      id: 3,
      name: 'Hotel Paraíso',
      price: 600,
    }
  ];

  return (
    <div className="likes-page">
      <h1>Seus Likes</h1>
      <div className="likes-list">
        {likes.map((item, index) => (
          <HotelCard key={index} hotel={item} />
        ))}
      </div>
    </div>
  );
};

export default LikesPage;
