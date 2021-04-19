const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const ArticleSchema = new Schema({
    text: { type: String, required: true },
    title: {type: String, required: true},
    author: { type: String, required: true },
    dateCreated: {type: Date , required: true},
    summary: { 
       summaryText: {type: String},
       biasAnalysis: {type: String},
       keywords: {type: String}
    },
    link: {type: String, required: false},
    linkToImage: {type: String, required: false},
    comments:[
      {type: Schema.Types.ObjectId, ref: 'Comment'}
    ],
    topics: {type: [String], required: true}
})

const Article = mongoose.model('Article', ArticleSchema);
module.exports = Article;

