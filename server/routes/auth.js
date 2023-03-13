const express = require('express')
const router = express.Router();

const authCtrl = require('../contollers/auth');


router.post('/auth', authCtrl.getUser)

module.exports = router;