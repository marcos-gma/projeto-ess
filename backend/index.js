import express from 'express';
import dotenv from 'dotenv';
import cookieParser from 'cookie-parser';

const app = express();

app.use(express.json());
dotenv.config();
app.use(cookieParser());

//routes imports

import pingRoutes from './routes/ping.routes.js';
import authRoutes from './routes/auth.routes.js';
import pagamentoRoutes from './routes/pagamento.routes.js';

app.use('/ping', pingRoutes);
app.use('/auth', authRoutes);
app.use('/payment-methods', pagamentoRoutes);

app.listen(5001);