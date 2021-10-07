const client = require('./database/dbconnect')
const path = require('path');
const express = require('express');
const app = express();
const port = 3000;

const start = async ()=>{
    try {
        client.connect();

        app.set("views", path.join(__dirname, "views"));
        app.set("view engine", "ejs");

        app.get('/', (req, res)=>{
            res.render('index', {qs: req.query});

            var sql = `
                SELECT COALESCE(l.name, b.name) AS Book name
                FROM books b
                LEFT JOIN localization l
                ON b.book_id=l.book_id AND l.lang_id = ${argFromQueryString}`

            client.query(sql, (err, result)=>{
                if (!err){
                    console.log(result.rows);
                    // res.send(result.rows);
                }else {
                    console.log(err.message);
                }
                client.end;
            });
        });

        app.listen(port, () => console.log("Server is listening " + port + " port"));
    } catch (e){
        console.log(e);
    }
}

start();