import fs from 'fs';
import path from 'path';
import { check } from 'prisma';
import { v4 as uuidv4 } from 'uuid';


export const createRating = async (req, res) => {
    try {
        const { confortoGrade, checkinGrade, comunicacaoGrade, localizacaoGrade, limpezaGrade, finalGrade, comment, accommodationId, reservationId } = req.body;

        if (!confortoGrade || !checkinGrade || !comunicacaoGrade || !localizacaoGrade || !limpezaGrade || !comment) {
            console.log("All fields are required");
            return res.status(400).json({
                error: "All fields are required"
            });
        }

        //Verificação de validade das notas será realizada no front a partir de categorização das respostas

        const idRating = uuidv4();

        var reservationsData = JSON.parse(fs.readFileSync(path.resolve('./samples/reservation.json'), 'utf8'));
        var accommodationsData = JSON.parse(fs.readFileSync(path.resolve('./samples/accommodations.json'), 'utf8'));

        const newRating = {
            idRating: idRating,
            accommodationName: reservationsData.accommodationName,
            confortoGrade,
            checkinGrade,
            comunicacaoGrade,
            localizacaoGrade,
            limpezaGrade,
            finalGrade,
            comment,
            accommodationId: accommodationsData.id,
            reservationId: reservationsData.id
        }

        accommodationsData.push(newRating);

        fs.writeFileSync(path.resolve('./samples/accommodations.json'), JSON.stringify(data, null, 2));

        res.status(201).json({
            message: "Accommodation published successfully",
            id: accommodationId
        });
    } catch (error) {
        console.log("Error in publishAccommodation controller:", error.message);
        res.status(500).json({
            error: "Internal Server Error"
        });
    }
}