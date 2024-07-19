import React from "react";
import { useNavigate } from "react-router-dom";
import "./style.css";


const NavBar = () => {
  const navigate = useNavigate();
  return (
    <nav>
      <div className="logo">
        <img src="https://www.shutterstock.com/image-vector/airbnb-logo-symbol-icon-sign-600nw-2198282283.jpg" alt="Airbnbeer" />
      </div>

      <div className="nome-da-empresa">
        <h1>Airbnbeer</h1>
      </div>
      <ul className="navbar-links">
        <li onClick={() => navigate("/")}>Home</li>
        <li onClick={() => navigate("/active-promos")}>Promoções Ativas</li>
      </ul>
      <button className="navbar-button" onClick={() => navigate("/login")}>
        Login
      </button>
    </nav>
  );
};

const HomePage = () => {
  return (
      <div>
        <NavBar />
        <h2>Home Page</h2>
        <p>Welcome to the Home Page</p>
      </div>
    );
};

export default HomePage;
