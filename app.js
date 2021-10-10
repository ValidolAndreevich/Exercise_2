const client = require('./database/dbconnect')
const path = require('path');
const express = require('express');
const app = express();
const port = 3000;
const reg = new RegExp('^[0-9]+$');

const start = async ()=>{
    try {
        client.connect();

        app.set("views", path.join(__dirname, "views"));
        app.set("view engine", "ejs");

        app.get('/', (req, res)=>{
            let argFromPage = req.query.langID;

            if (!reg.test(argFromPage)){
                argFromPage = "";
            }

            var sql = `
                SELECT COALESCE(l.name, b.name) AS name
                FROM books b
                LEFT JOIN localization l
                ON b.book_id=l.book_id AND l.lang_id = ${argFromPage};`

            client.query(sql, (err, result)=>{
                if (!err && result){
                    res.render('index', {qs: result.rows});
                }else {
                    res.render('index', {qs: null});
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