const express = require('express')
const router = express.Router();

const authCtrl = require('../contollers/user');


router.post('/api/user', authCtrl.getUser)

module.exports = router;