const articlesRouter = require("express").Router();
const NewsAPI = require('newsapi');
const newsapi = new NewsAPI('941f59e75f7941d1b57506e0fb5aa0ba');
let Article = require('../models/ArticleSchema');
let SummarizerManager = require("node-summarizer").SummarizerManager;

 

articlesRouter.route('/summary').get((req, res) => {
  Article.find()
      .then((article)=> {
        let text = "The Home page is the first page that users will access when visiting the website, which will show the overview of the website and include important Pioneers and Technologies that will attract the users attention. Users can then click on the Pioneers and Technologies in the Home page to view the full details of them on the Pioneers page and Technologies page respectively. The Pioneers page will have 3 components, the first will be a list of all the Pioneers that the students researched on, the second which will be the detailed full information of the pioneer that a user wants to learn more about, and the third which will be a Pioneer of the day section which will list a new pioneer everyday based on if their birthday is on the day the user access the website on. The Technology page will have 1 section which will list all the technologies timeline that the students researched on. In each of the Technology will be a button which the user can click on to view an overview of the technology that the user wishes to learn more about, as well as have a button which will redirect the user to the HTML page that the students created which will list the students full research on the technology."
        let Summarizer = new SummarizerManager(text,3);
        let summary = Summarizer.getSummaryByRank().then((summary_object)=>{
          console.log(summary_object.summary)
      })
        let sentiment = Summarizer.getSentiment();
        res.json(sentiment)
      })
      .catch(err => res.status(400).json('Error: ' + err));

  

});

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
        newArticlesArr = [];
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

            newArticlesArr.push(newArticle);
        }

        Article.insertMany(newArticlesArr)
        .then(()=> {
            res.status(200).json("new articles inserted");
<<<<<<< HEAD

=======
>>>>>>> e91f424764bf5eabff958d351e6be20b5c651324
        })
        .catch((error) => {
            console.log(error);
        })

      });
})


module.exports = articlesRouter;