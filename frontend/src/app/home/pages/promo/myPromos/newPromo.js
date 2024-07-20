import React from "react";
import Button from "../../Compartilhado/button.js";
import NavBar from "../../Compartilhado/navbar.js";

const NewPromo = () => {
    return (
        <div>
        <NavBar />
        <div className="main">
            <h1>Create a new promo</h1>
            <form>
            <label>
                Nome da Promoção:
                <input type="text" name="promoName" />
            </label>
            <br></br>
            <label>
                Nome do Hotel:
                <input type="text" name="nome" />
            </label>
            <br></br>
            <label>
                Desconto:
                <input type="number" name="desconto" />
            </label>
            <br></br>
            <label>
                Data de Início:
                <input type="date" name="data_inicio" />
            </label>
            <br></br>
            <label>
                Data de Fim:
                <input type="date" name="data_fim" />
            </label>
            <br></br>
            <Button nome="Create" destino="/my-promos" />
            </form>
        </div>
        </div>
    );
};  

export default NewPromo;