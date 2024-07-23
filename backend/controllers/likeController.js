import fs from 'fs';
import path from 'path';
import { getUserId } from '../utils.js';

export const like =  async (req, res) => {
    try {
        const { userId, accommodationId } = req.body;
        var user_data = JSON.parse(fs.readFileSync(path.resolve('./samples/users.json'), 'utf8'));
        var hotel_data = JSON.parse(fs.readFileSync(path.resolve('./samples/hotels.json'), 'utf8'));

        if (!userId || !accommodationId) {
            console.log("All fields are required")
            return res.status(400).json({
                error: "All fields are required"
            });
        }

        userId = getUserId(userId);

        var user = user_data.find(user => user.id === userId);
        
        if (!user) {
            console.log("User not found");
            return res.status(404).json({ error: "User not found" });
        }

        var hotel = hotel_data.find(hotel => hotel.id === accommodationId);

        if (!hotel) {
            console.log("Hotel not found");
            return res.status(404).json({ error: "Hotel not found" });
        }

        if (!user.liked.includes(accommodationId)){
            user.liked.push(accommodationId);
            hotel.likes += 1;
            console.log("Added Hotel");
            fs.writeFileSync(path.resolve('./samples/users.json'), JSON.stringify(user_data, null, 2));
            fs.writeFileSync(path.resolve('./samples/hotels.json'), JSON.stringify(hotel_data, null, 2));
            return res.status(200).json({
                "Liked": hotel.name
            });
        } else {
            return res.status(400).json({ error: "Hotel already liked" });
        }
        
    }
    catch (error) {
        console.log("Error in Like controller:", error.message)
        res.status(500).json({
            error: "Internal Server Error"
        })
    
    }
}

export const removeLike =  async (req, res) => {
    try {
        const { userId, accommodationId } = req.body;
        var user_data = JSON.parse(fs.readFileSync(path.resolve('./samples/users.json'), 'utf8'));
        var hotel_data = JSON.parse(fs.readFileSync(path.resolve('./samples/hotels.json'), 'utf8'));

        if (!userId || !accommodationId) {
            console.log("All fields are required")
            return res.status(400).json({
                error: "All fields are required"
            });
        }

        userId = getUserId(userId);

        var user = user_data.find(user => user.id === userId);

        if (!user) {
            console.log("User not found");
            return res.status(404).json({ error: "User not found" });
        }

        var hotel = hotel_data.find(hotel => hotel.id === accommodationId);

        if (!hotel) {
            console.log("Hotel not found");
            return res.status(404).json({ error: "Hotel not found" });
        }

        if (user.liked.includes(accommodationId)){
            user.liked = user.liked.filter(item => item !== accommodationId);
            hotel.likes--;
            console.log("Removed Hotel");
            fs.writeFileSync(path.resolve('./samples/users.json'), JSON.stringify(user_data, null, 2));
            fs.writeFileSync(path.resolve('./samples/hotels.json'), JSON.stringify(hotel_data, null, 2));
            return res.status(200).json({
                "Removed Like": hotel.name
            });
        }

    }
    catch (error) {
        console.log("Error in Like controller:", error.message)
        res.status(500).json({
            error: "Internal Server Error"
        })
    
    }
}
export const getLikes =  async (req, res) => {
    try {
        const { userId } = req.body;
        var user_data = JSON.parse(fs.readFileSync(path.resolve('./samples/users.json'), 'utf8'));
        var hotel_data = JSON.parse(fs.readFileSync(path.resolve('./samples/hotels.json'), 'utf8'));

        if (!userId) {
            console.log("Log in to view your likes")
            return res.status(400).json({
                error: "Log in to view your likes"
            });
        }

        userId = getUserId(userId);

        var user = user_data.find(user => user.id === userId);

        if (!user) {
            console.log("User not found");
            return res.status(404).json({ error: "User not found" });
        } else {

            let likedHotels = [];

            for(let i = 0; i < user.liked.length; i++){
                let hotel = hotel_data.find(hotel => hotel.id === user.liked[i]);
                likedHotels.push(hotel.name);
            }

            console.log("Liked: ", likedHotels);
            return res.status(200).json({
                liked: likedHotels
            });
        }

    }

    catch (error) {
        console.log("Error in Like controller:", error.message)
        res.status(500).json({
            error: "Internal Server Error"
        })
    
    } 
}