const router = require('express').Router();
const pool = require('../db');


router.get('/', async(req, res)=>{
    try {
        const response = await pool.query('select * from books');
        res.json(response.rows);
    } catch (error) {
        console.error(error.message);
    }
})



module.exports = router;