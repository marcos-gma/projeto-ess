import express from 'express';
import { createReservation, getReservation, listAccommodationReservations } from '../controllers/reservationController.js';
import { cancelReservation } from '../controllers/reservationController.js';

const router = express.Router();

//@TODO double-check router routes
router.get('host/accommodations/reservations', listAccommodationReservations);
router.delete('host/accommodations/reservations/:userId/:reservationId', cancelReservation);
router.post('guest/hoteis/:acomId', createReservation);
router.get('/guest/minhas_reservas', getReservation);
// router.delete('guest/minhas_reservas/:reservaId', hostCancelReservation);
// router.put('guest/minhas_reservas/:reservaId', editReservation);

export default router;