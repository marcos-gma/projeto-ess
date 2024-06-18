import express from 'express';
import { createRating } from '../controllers/ratingController.js';

const router = express.Router();

router.post('/guest/reservations/avaliacao/:idRating', createRating);

export default router