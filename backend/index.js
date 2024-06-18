import express from 'express';
import dotenv from 'dotenv';
import cookieParser from 'cookie-parser';

const app = express();

app.use(express.json())
dotenv.config()
app.use(cookieParser())

//routes imports

import pingRoutes from './routes/ping.routes.js'
import authRoutes from './routes/auth.routes.js'
import likeRoutes from './routes/like.routes.js'
import searchRoutes from './routes/search.routes.js'
import saveRoutes from './routes/save.routes.js'
import shareRoutes from './routes/share.routes.js'

app.use('/ping', pingRoutes)
app.use('/auth', authRoutes)
app.use('/liking', likeRoutes)
app.use('/searching', searchRoutes)
app.use('/saving', saveRoutes)
app.use('/share', shareRoutes)

app.post('/', (req, res) => {
    res.send('Vou chorar');
    console.log('funcionou');
});

app.listen(5001)


