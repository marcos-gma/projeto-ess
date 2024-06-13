import express from 'express'

const app = express();

app.use(express.json())

//routes imports

import pingRoutes from './routes/ping.routes.js'

app.use('/ping', pingRoutes)

app.listen(5001)