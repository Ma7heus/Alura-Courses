const fs = require('fs');

const data = fs.readFileSync('./nubank.ofx', 'utf-8');
console.log(data);
