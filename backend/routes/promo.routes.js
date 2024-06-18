import express from 'express';
import { createPromo, deletePromo, editPromo, listPromos } from '../controllers/promoController.js';

const router = express.Router();

router.get('/promocoes_cadastradas', listPromos);
router.post('/cadastrar_promocao', createPromo);
router.delete('/deletar_promocao/:id', deletePromo);
router.put('/editar_promocao/:id', editPromo);

export default router;