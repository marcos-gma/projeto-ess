// guarda as rotas das promoções

import express from 'express';
const { createPromo, deletePromo, editPromo, listPromos } = require('../controllers/promoController.js');

const router = express.Router();

router.get('/promocoes_cadastradas', listPromos);
router.post('cadastrar_promocao/', createPromo);
router.delete('../deletar_promocao/:promoId', deletePromo);
router.put('/:promoId', editPromo);


export default promoRoutes;

