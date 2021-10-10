const {Client} = require('pg');

const client = new Client({
    host: "localhost",
    user: "PLACEHOLDER",
    port: 5432,
    password: "PLACEHOLDER",
    database: "lib_db"
});

module.exports = client;
