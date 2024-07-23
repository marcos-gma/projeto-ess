import React from 'react';
import { Link } from 'react-router-dom';
import './styles.css'; 

const UserProfile = () => {
  const user = {
    name: 'John Doe',
    email: 'john.doe@example.com',
    photo: 'https://via.placeholder.com/150'
  };

  return (
    <div className="user-profile">
      <img src={user.photo} alt="User Photo" className="user-photo" />
      <h2>{user.name}</h2>
      <p>{user.email}</p>
      <div className="user-links">
        <Link to="/likes">Likes</Link>
        <Link to="/saved-hotels">Saved Hotels</Link>
      </div>
    </div>
  );
};

export default UserProfile;
