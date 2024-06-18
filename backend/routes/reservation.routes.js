import express from 'express';
import { createReservation, listAccommodationReservations } from '../controllers/reservationController.js';
import { cancelReservation } from '../controllers/reservationController.js';

const router = express.Router();

//@TODO double-check router routes
router.get('host/accommodations/reservations', listAccommodationReservations);
router.delete('host/accommodations/reservations/:userId/:reservationId', cancelReservation);
router.post('/guest/minhas_reservas/:userId/:acomId', createReservation);

export default router;
