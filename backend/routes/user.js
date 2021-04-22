const userRouter = require("express").Router();
let User = require('../models/UserSchema');


userRouter.route('/createUser').post((req, res) => {
    let username = req.body.username;
    let password = req.body.username;
    let email = req.body.email;
    let firstName = req.body.firstName;
    let lastName = req.body.firstName;

    const newUser = new User({
        username,
        password,
        email,
        firstName,
        lastName
    });

    User.save(newUser)
    .then(()=> {
        res.status(200).json("new user added");
    })
    .catch((error) => {
        console.log(error);
    })

})


userRouter.route('/login/:username:password').post((req, res) => {
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