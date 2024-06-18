import express from 'express';
import { visualize, add, remove, select } from '../controllers/paymentMethodsController.js';


const router = express.Router();

router.get('/visualize', visualize);
router.post('/add', add);
router.delete('/remove', remove);
router.put('/select', select);

export default router;