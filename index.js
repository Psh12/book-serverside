const express = require('express');
const cors = require('cors');
const register_login = require('./routes/jwtAuth');
const dashboard = require('./routes/dashboard')


const app = express();
app.use(express.json())
app.use(cors());

// Register and Login Routes
app.use('/auth',register_login);

// Dashboard Route
app.use('/dashboard',dashboard );

app.listen(5000, ()=>{
    console.log("Server started at Port 5000.....");
})