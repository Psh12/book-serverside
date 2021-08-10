const {Pool} = require('pg');
require("dotenv").config();
const pool = new Pool({
    user: process.env.PG_user,
    password: process.env.PG_password,
    host: process.env.PG_host,
    port: process.env.PG_port,
    database: process.env.PG_database
});

module.exports = pool;