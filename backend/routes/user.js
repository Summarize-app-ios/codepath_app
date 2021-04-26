const userRouter = require("express").Router();
let User = require('../models/UserSchema');

userRouter.route('/login/:username/:password').get((req, res) => {

    User.findOne({userName: req.params.username, password: req.params.password})
    .then((user) => {
        console.log(user);
        if(user == null){
            res.status(400).json("User not found");
        } else {
            res.status(200).json(user);
        }
    })
    .catch((error) => {
        res.status(400).json("Invalid request");
    })

})



userRouter.route('/createUser').post((req, res) => {
    const userName = req.body.userName;
    const password = req.body.password;
    const email = req.body.email;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;

    const newUser = new User({
        userName,
        password,
        email,
        firstName,
        lastName
    });

    newUser.save()
    .then((user)=> {
        res.status(200).json(user["_id"]);
    })
    .catch((error) => {
        console.log(error);
    })

})



module.exports = userRouter;