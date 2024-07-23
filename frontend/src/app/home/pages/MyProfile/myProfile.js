import React from 'react';
import { Link } from 'react-router-dom';
import './styles.css'; 

const UserProfile = () => {
  const id = getItem("Token")
  const user = {
    name: 'José Maria',
    email: 'mfp2@cin.ufpe.br',
    photo: 'https://f4.bcbits.com/img/a1801332551_10.jpg'
  };

  return (
    <div className="user-profile">
      <img src={user.photo} alt="User Photo" className="user-photo" />
      <h2>{user.name}</h2>
      <p>{user.email}</p>
      <div className="user-links">
        <Link to="/Likes">Likes</Link>
        <Link to="/Saves">Saved Hotels</Link>
      </div>
    </div>
  );
};

export default UserProfile;
