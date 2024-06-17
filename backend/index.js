import cookieParser from 'cookie-parser';
import dotenv from 'dotenv';
import express from 'express';

const app = express();

app.use(express.json())
dotenv.config()
app.use(cookieParser())

//routes imports
import pingRoutes from './routes/ping.routes.js'
import authRoutes from './routes/auth.routes.js'
import emailRoutes from './routes/email.routes.js'
import promoRoutes from './routes/promo.routes.js';

//accomodation routes
import accommodationRoutes from './routes/acom.routes.js';
    //@TODO doublecheck routes
app.use('/user', accommodationRoutes);

//reservation routes
import reservationRoutes from './routes/reservation.routes.js';
    //@TODO doublecheck routes
app.use('/user', reservationRoutes);



app.use('/ping', pingRoutes)
app.use('/auth', authRoutes)
app.use('/email', emailRoutes)
app.use('/promo', promoRoutes)

app.listen(5001, () => {
    console.log("\nServer is listening on port 5001");
  });
