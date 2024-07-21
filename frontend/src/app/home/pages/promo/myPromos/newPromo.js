import React, { useState } from "react";
import Modal from "react-modal";
import Button from "../../Compartilhado/button.js";
import NavBar from "../../Compartilhado/navbar.js";

Modal.setAppElement('#root'); 

const NewPromoModal = () => {
  const [modalIsOpen, setModalIsOpen] = useState(false); // Hook para abrir e fechar o modal

  const openModal = () => {
    setModalIsOpen(true);
  };

  const closeModal = () => {
    setModalIsOpen(false);
  };

  return (
    <div>
      <NavBar />
      <div className="main">
        <button onClick={openModal}>Create a new promo</button>
        <Modal
          isOpen={modalIsOpen}
          onRequestClose={closeModal}
          style={{
            overlay: {
              backgroundColor: 'rgba(0, 0, 0, 0.5)',
            },
            content: {
              top: '50%',
              left: '50%',
              right: 'auto',
              bottom: 'auto',
              marginRight: '-50%',
              transform: 'translate(-50%, -50%)',
            },
          }}
        >
          <h1>Create a new promo</h1>
          <form>
            <label>
              Nome da Promoção:
              <input type="text" name="promoName" />
            </label>
            <br />
            <label>
              Nome do Hotel:
              <input type="text" name="nome" />
            </label>
            <br />
            <label>
              Desconto:
              <input type="number" name="desconto" />
            </label>
            <br />
            <label>
              Data de Início:
              <input type="date" name="data_inicio" />
            </label>
            <br />
            <label>
              Data de Fim:
              <input type="date" name="data_fim" />
            </label>
            <br />
            <Button nome="Create" destino="/my-promos" />
          </form>
          <button onClick={closeModal}>Close</button>
        </Modal>
      </div>
    </div>
  );
};

export default NewPromoModal;
