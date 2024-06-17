import express from 'express';
import { publishAccommodation } from '../controllers/acomController.js';

const router = express.Router();

//@TODO double-check router rout
router.post('/host/accommodations', publishAccommodation);

export default router;
