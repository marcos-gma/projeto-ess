import React from 'react';

const HotelCard = ({ hotel }) => {
  console.log('Hotel data:', hotel);
  
  if (!hotel) {
    return <div>Invalid hotel data</div>;
  }

  return (
    <div className="hotel-card">
      <h2>{hotel.name || 'No name available'}</h2>
      <p>{hotel.price || 'No location available'}</p>
    </div>
  );
};

export default HotelCard;
