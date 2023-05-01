const express = require('express')
const router = express.Router();

const authCtrl = require('../contollers/auth');


router.post('/api/user', authCtrl.getUser)

module.exports = router;