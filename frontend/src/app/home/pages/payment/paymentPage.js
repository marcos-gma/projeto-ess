import React, { useState, useEffect } from 'react';
import NavBar from '../Compartilhado/navbar.js';
import Visualize from '../../services/payment/visualize.js';
import './style.css';


const PaymentPage = () => {
  return (
    <div>
      <NavBar />
      <div className='main'>
        <h2>Payment Page</h2>
        <p>Welcome to the Payment Page</p>
      </div>
    </div>
  )
}

export default PaymentPage
