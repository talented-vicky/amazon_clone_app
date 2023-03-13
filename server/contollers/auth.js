const User = require("../models/user")


exports.getUser = async (req, res, next) => {    
    try {
        // const {name, email, password} = req.body
        const userEmail = req.body.email;
        const userName = req.body.name;
        const userPassword = req.body.password;
    
        // const existingUser = await User.findOne({ email })
        const existingUser = await User.findOne({email: userEmail})
        if(existingUser){
            return res.status(400).json({msg: "User with this email already exist"})
        }
        //create user
        const user = new User({
            name: userName, email: userEmail, password: userPassword
        })
        await user.save()
        res.json(user)
    }
    catch(err){
        res.status(500).json({error: err.message})
    }
    
}