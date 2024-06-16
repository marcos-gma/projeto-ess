import cookieParser from 'cookie-parser';
import dotenv from 'dotenv';
import express from 'express';

const app = express();

app.use(express.json())
dotenv.config()
app.use(cookieParser())

//routes imports

import authRoutes from './routes/auth.routes.js';
import pingRoutes from './routes/ping.routes.js';
import promoRoutes from './routes/promo.routes.js';

app.use('/ping', pingRoutes)
app.use('/auth', authRoutes)
app.use('/promo', promoRoutes)

app.listen(5001, () => {
    console.log("\nServer is listening on port 5001");
  });