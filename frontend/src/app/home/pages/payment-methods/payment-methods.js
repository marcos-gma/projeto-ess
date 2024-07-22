import React from 'react'
import NavBar from '../Compartilhado/navbar.js'
import './style.css'

const paymentMethods = () => {
  return (
    <div>
      <NavBar />
      <div className='main'>
        <h2>Métodos de pagamento</h2>
        <p>Lista de métodos de pagamento</p>
      </div>
    </div>
  )
}

export default paymentMethods
