const userRouter = require("express").Router();
let User = require('../models/UserSchema');


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
    .then(()=> {
        res.status(200).json("new user added");
    })
    .catch((error) => {
        console.log(error);
    })

})


userRouter.route('/login/:username:password').get((req, res) => {
    let username = req.params.username;
    let password = req.params.password;

    User.findOne({username: username, password: password})
    .then(() => {
        res.status(200).json("user found");
    })
    .catch((error) => {
        console.log(error);
    })

})


module.exports = userRouter;