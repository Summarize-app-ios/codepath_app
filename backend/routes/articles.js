const articlesRouter = require("express").Router();
const NewsAPI = require('newsapi');
const newsapi = new NewsAPI('941f59e75f7941d1b57506e0fb5aa0ba');
let Article = require('../models/ArticleSchema');

articlesRouter.route('/').get( async (req, res) => {
    newsapi.v2.everything({
        sources: 'bbc-news,the-verge',
        language: 'en',
        sortBy: 'popularity',
        pageSize: 10
      })
      .then(response => {
        // console.log(response);
        let articles = response["articles"];
        for(let i = 0; i < articles.length; i++){
            text = articles[i].content;
            author = articles[i].author;
            link = articles[i].url;
            linkToImage = articles[i].urlToImage;
            dateCreated = Date(articles[i].publishedAt);
            title = articles[i].title;

            const newArticle = new Article({
                text,
                author,
                link,
                linkToImage,
                dateCreated,
                title
            });

            await newArticle.save()
            .then(() => res.json("New article added"))
            .catch(err => res.status(400)).json("Error: " + err);
        }

      });
})


module.exports = articlesRouter;