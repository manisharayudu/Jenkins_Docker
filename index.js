
const express = require('express');

// Constants
const PORT = 3000;
const HOST = '3.67.84.12';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
