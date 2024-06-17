import fs from 'fs';
import path from 'path';

// Função para listar reservas na acomodação
export const listAccommodationReservations = async (req, res) => {
    try {
        const { userId, accommodationId } = req.query;

        if (!userId || !accommodationId) {
            console.log("User ID and Accommodation ID are required");
            return res.status(400).json({
                error: "User ID and Accommodation ID are required"
            });
        }

        var reservationsData = JSON.parse(fs.readFileSync(path.resolve('./samples/reservations.json'), 'utf8'));
        var accommodationsData = JSON.parse(fs.readFileSync(path.resolve('./samples/accommodations.json'), 'utf8'));

        const accommodation = accommodationsData.find(accommodation => accommodation.id === accommodationId && accommodation.userId === userId);
        if (!accommodation) {
            console.log("Accommodation not found or does not belong to the user");
            return res.status(404).json({
                error: "Accommodation not found or does not belong to the user"
            });
        }

        const accommodationReservations = reservationsData.filter(reservation => reservation.accommodationId === accommodationId);

        res.status(200).json({
            reservations: accommodationReservations.map(({ id, dataReserva }) => ({ id, dataReserva }))
        });

    } catch (error) {
        console.log("Error in listAccommodationReservations controller:", error.message);
        res.status(500).json({
            error: "Internal Server Error"
        });
    }
};
