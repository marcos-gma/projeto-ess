import fs from 'fs';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';

function finalGrade(nota1, nota2, nota3, nota4, nota5) {
    let soma = (nota1 + nota2 + nota3 + nota4 + nota5)
    let media = soma / 5
    return media.toFixed(2)
}

var data = JSON.parse(fs.readFileSync(path.resolve('./samples/rating.json'), 'utf8'))
var acomData = JSON.parse(fs.readFileSync(path.resolve('./samples/accommodations.json'), 'utf8'))
var reserveData = JSON.parse(fs.readFileSync(path.resolve('./samples/reservation.json'), 'utf8'))

export const createRating = async (req, res) => {
    try {
        const { confortoGrade, checkinGrade, comunicacaoGrade, localizacaoGrade, limpezaGrade, comment } = req.body;
        if (!confortoGrade || !checkinGrade || !comunicacaoGrade || !localizacaoGrade || !limpezaGrade || !comment) {
            console.log("All fields are required");
            return res.status(400).json({
                error: "All fields are required"
            });
        }

        const { resId } = req.params

        //PRECISO DA RESID PARA VINCULAR AO RATING



        //Verificação de validade das notas será realizada no front a partir de categorização das respostas

        let reserva = reserveData.find(reserve => String(reserve.id) === String(resId))
        let acomName = reserva.accommodationName
        let acomId = reserva.accommodationId
        let userId = reserva.userId

        const newRating = {
            id: uuidv4(),
            acomName,
            confortoGrade,
            checkinGrade,
            comunicacaoGrade,
            localizacaoGrade,
            limpezaGrade,
            notaFinal: finalGrade(confortoGrade, checkinGrade, comunicacaoGrade, localizacaoGrade, limpezaGrade),
            comment,
            acomId,
            resId,
            userId
        }
        //Modificações em accommodations.json

        let acomodacao = acomData.find(acom => acom.id === acomId)

        acomodacao.ratingsId.push(newRating.id)

        fs.writeFileSync(path.resolve('./samples/accommodations.json'), JSON.stringify(acomData, null, 2));

        //Modificações em rating.json

        data.push(newRating)

        fs.writeFileSync(path.resolve('./samples/rating.json'), JSON.stringify(data, null, 2));

        res.status(201).json(newRating)

    } catch (error) {
        res.status(500).json({
            error: "Internal Server Error (Create Rating)"
        });
    }
}
export const listRating = async (req, res) => {
    try {
        const { acomId } = req.params
        const ratings = acomData.find(acom => String(acom.id) === String(acomId));
        let output = []
        ratings.ratingsId.forEach(rate => {
            let encontra = data.find(elemento => elemento.id === rate)
            if (encontra !== undefined) {
                output.push(encontra)
            }
        })

        res.status(200).json(output);

    } catch (error) {
        res.status(400).json({
            error: "Internal Server Error (List Ratings)"
        });
    }
};


//Verificação de validade das notas será realizada no front a partir de categorização das respostas

