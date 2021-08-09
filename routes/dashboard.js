const router = require('express').Router();
const pool = require('../db');
const authorization = require('../Middleware/authorization');

router.get("/", authorization, async (req, res)=>{
    try {
        const user = await pool.query('Select user_name from users where user_id = $1', [req.user]);
        res.json(user.rows[0]);
    } catch (error) {
        console.error(error.message);
        res.status(403).json("Not Authorized");
    }
})

router.get("/userBooks", authorization, async (req, res) =>{
    try {
        // Join query to return books data along with author information
        const user_books = await pool.query('select books.book_number, books.title, books.link, books.synopsis,books.demographic, books.genre, n1.user_id, n1.ub_id from books inner join (select book_number, user_id, ub_id from user_book where user_id = $1) n1 on books.book_number = n1.book_number',[req.user])
        res.json(user_books.rows);
    } catch (error) {
       console.error(error.message);
       res.status(403).json("Not Authorized"); 
    }
})

// Route to add books to the user_books table

/*
router.post("/userBooks", authorization, async(req, res)=>{
    try {
        const {user_id, book_number} = req.query;
        const added_book = await pool.query('INSERT INTO user_book(book_number, user_id) VALUES ($1,$2) Returning *',[book_number, user_id]);
        res.json(added_book.rows);
    } catch (error) {
        console.error(error.message);
    }
})
*/

// Delete the book of a particular user
router.delete("/userBooks", authorization, async (req,res) =>{
    try {
       const {user_id, book_number} = req.query;
       const deleted_book = await pool.query('Delete from user_book where user_id = $1 and book_number = $2 Returning *', [user_id, book_number]);
       //console.log(deleted_book);
       
       res.json(deleted_book.rows); 
    } catch (error) {
        console.error(error.message);
        res.status(403).json("Not Authorized");
    }
})


module.exports = router;