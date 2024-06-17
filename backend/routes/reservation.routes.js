import express from 'express';
import { listAccommodationReservations } from '../controllers/reservationController.js';

const router = express.Router();

//@TODO double-check router routes
router.get('host/accommodations/reservations', listAccommodationReservations);

export default router;
