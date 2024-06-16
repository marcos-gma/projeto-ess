// guarda as rotas das promoções

const express = require('express');
const router = express.Router();
const promoController = require('../controllers/promoController.js');

router.get('/promos', promoController.listPromos);
router.post('/promos', promoController.createPromo);
router.delete('/promos/:promoId', promoController.deletePromo);
router.put('/promos/:promoId', promoController.editPromo);

module.exports = router;