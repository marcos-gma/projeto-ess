import fs from 'fs';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';

export const publishAccommodation = async (req, res) => {
    try {
        const { nome, quantidadeQuartos, lotacaoMaxima, precoPorNoite } = req.body;

        // validações 
        if (!nome || !quantidadeQuartos || !lotacaoMaxima || !precoPorNoite) {
            console.log("All fields are required");
            return res.status(400).json({
                error: "All fields are required"
            });
        }

        if (isNaN(quantidadeQuartos) || quantidadeQuartos <= 0) {
            console.log("Quantity of rooms must be a positive number");
            return res.status(400).json({
                error: "Quantity of rooms must be a positive number"
            });
        }

        if (isNaN(lotacaoMaxima) || lotacaoMaxima <= 0) {
            console.log("Maximum occupancy must be a positive number");
            return res.status(400).json({
                error: "Maximum occupancy must be a positive number"
            });
        }

        if (isNaN(precoPorNoite) || precoPorNoite <= 0) {
            console.log("Price per night must be a positive number");
            return res.status(400).json({
                error: "Price per night must be a positive number"
            });
        }

        var data = JSON.parse(fs.readFileSync(path.resolve('./samples/accommodations.json'), 'utf8'));

        const accommodationId = uuidv4();
        const newAccommodation = {
            id: accommodationId,
            nome,
            quantidadeQuartos,
            lotacaoMaxima,
            precoPorNoite
        };

        data.push(newAccommodation);

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
};
