import React from "react";
import { useNavigate } from "react-router-dom";
import "./style.css";


const NavBar = () => {
  const navigate = useNavigate();
  return (
    <nav>
      <ul>
        <li onClick={() => navigate("/")}>Home</li>
        <li onClick={() => navigate("/active-promos")}>Promoções Ativas</li>
      </ul>
    </nav>
  );
};

const HomePage = () => {
  return (
      <div>
        <header>
          <h1>Home Page</h1>
        </header>
        <NavBar />
        <p>Welcome to the Home Page</p>
      </div>
    );
};

export default HomePage;
