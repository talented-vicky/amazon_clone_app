const mongoose = require("mongoose")

const Schema = mongoose.Schema

const userModel = new Schema({
    name: {
        required: true,
        trim: true,
        type: String,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: val => {
                const regex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
                return val.match(regex)
            },
            message: "email invalid" //only runs if validator above is false
        }
    },
    password: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: val => {
                return val.length > 7
            },
            message: "password should be at least 8 characters"
        }
    },
    address: {
        type: String,
        default: ""
    },
    type: {
        type: String,
        default: "user"
    }
})

module.exports = mongoose.model('User', userModel)