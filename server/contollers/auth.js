const User = require("../models/user")
const bcrypt = require('bcryptjs')


exports.getUser = async (req, res, next) => {  
    res.header("Access-Control-Allow-Origin", "*")  
    res.header("Access-Control-Allow-Methods", "GET,PUT,PATCH,POST,DELETE")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-with, Content-Type, Accept")
    try {
        const {name, email, password} = req.body

        const hashedPass = await bcrypt.hash(password, 10);
        if(!hashedPass){
            console.log('Failed to encrypt password')
        }

        // const existingUser = await User.findOne({ email })
        const existingUser = await User.findOne({email: userEmail})
        if(existingUser){
            return res.status(400).json({msg: "User with this email already exists"})
        }
        //create user
        const user = new User({
            name, email, password: hashedPass
        })
        await user.save()
        res.json(user)
    }
    catch(err){
        res.status(500).json({error: err.message})
    }
    
}