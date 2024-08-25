const express = require('express');
const cors = require('cors');
const app = express();

const studentsRoute = require('./routes/students');

// middlewares to parse the incoming request
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(cors({
    origin: 'http://localhost:8081',
}))


// routes
app.use('/api/student', studentsRoute);



app.listen(3000, () => {
    console.log('Server is running on port 3000');
});