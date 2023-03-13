const express = require('express');
const mongoose = require('mongoose');

const authRoute = require('./routes/auth');

require('dotenv').config()
const PORT_NAME = process.env.PORT_NAME;
const URI_STRING = process.env.URI_STRING;

const app = express();

app.use(express.json())
app.use(authRoute);


mongoose.connect(URI_STRING)
    .then(result => {
        console.log('Connected to MongoDB')
    })
    .catch(err => console.log(err))

app.listen(PORT_NAME, "0.0.0.0", () => {
    console.log(`listening at port: ${PORT_NAME}`);
})