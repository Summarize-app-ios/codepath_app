const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const CommentSchema = new Schema({
    text: { type: String, required: true },
    author: { type: String, required: true },
    dateCreated: {type: Date , required: true}
})

const Comment = mongoose.model("Comment", CommentSchema);
module.exposts = Comment;