import express from 'express';
import { createPromo, deletePromo, editPromo, listPromos } from '../controllers/promoController.js';

const router = express.Router();

router.get('/promocoes_cadastradas', listPromos);
router.post('/cadastrar_promocao', createPromo);
router.delete('/deletar_promocao/:promoId', deletePromo);
router.put('editar_promocao/:promoId', editPromo);

export default router;