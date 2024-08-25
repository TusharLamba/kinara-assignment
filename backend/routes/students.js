const express = require('express');
const router = express.Router();

const studentController = require('../controllers/student');

router.post('/getAllDetails', studentController.getAllDetails);

module.exports = router;
