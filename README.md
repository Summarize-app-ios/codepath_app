Original App Design Project - README Template
===

# NewsMe

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[Summarizes audiobooks, news articles, podcasts, research papers -> then be able to see bias on the piece of media using machine learning to see what side or how neutral the media truly is or claims to be. All media has bias no matter how neutral it seems to be and we are trying to expose this bias via machine learning, without any human bias being involved.]

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category: productivity/lifestyle**
- **Mobile: iOS**
- **Story: Seeing how people today have very little time to read media, our app help to minimize their time reading these long pieces of media by summarizing media while showing users the underlying bias that these pieces of media try to portray. Our peers who are intrested in reading/listening to media will be respond positively to our product idea.**
- **Market: : Our target audience is users who dont have times to read or listen to media but still want to access the information presented in these media, therefore we believe the size and scale of your potential users is pretty big. Our app is designed for a genral purposes that helps solve a problem for a large group of users, but is not valuable to a niche group of users. We have a well defined audience for our app.**
- **Habit: Ideally users will use the app once or twice a day, we want to promate the idea of building a habit of redeang the news, and users would consume not create with our app.**
- **Scope: The scope for the app is pretty well defined as we know what features we want to implement into the app and how the app will work at its core. The app will be technically challanging due to the additions of features which will involve machine learning and bias detection. The app at its core, stripped down, summarizes media which in itself is not as interesting as the app with the feature to detect bias.**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] [launch page]
* [x] [user registration page]
* [x] [user login page]
* [x] [trending page]
* [x] [personilized user page]
* [ ] [import media page]
* [ ] [summerizer page (that has setting to summerizes the media)]
* [ ] [summerized page (that displayes the media summarized)]


**Optional Nice-to-have Stories**

* [users can choose media outlets that they perfer to personalize their user page]
* [audiobooks tab]
* [podcast tab]
* [comment section]
* [setting page]

### 2. Screen Archetypes

* [Login page]
* [registration page]
* [Home page]
* [Import media page]
* [Summarizer page (which will take the media and show option to summarize)]
* [Summarized page (which will show the media summarized with those options)]
* [Article page]
* [Trending page]
* [Personalized user page]
   * [list associated required story here]
   * ...
* [list second screen here]
   * [list associated required story here]
   * ...

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [articles tab]
* [audiobooks tab]
* [audiobooks tab]

**Flow Navigation** (Screen to Screen)

* [Login page]
   * [Home page]
* [register page]
   * [Home page]
* [home page]
   * [trending page]
   * [personalized user page]
   * [import page]
   * [Summarizer page]
   * [article page]
* [Summarizer page]
   * [Summarized page]
* [list second screen here]
   * [list screen navigation here]
   * ...


## Wireframes
<img width="377" alt="Screen Shot 2021-04-03 at 8 35 48 PM" src="https://user-images.githubusercontent.com/60724653/113495078-c84a3100-94bc-11eb-95b9-8ffb40a31b21.png">
https://www.figma.com/file/SJyByJyiToCHia6SDeOZdn/CodePath-project-wireframe?node-id=0%3A1

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

## User Schema
```js
const UserSchema = new Schema({
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    email: { type: String, required: true },
    password: { type: String, required: true, lowercase: false },
    userName: { type: String, required: true },
    preferences: { type: [String], required: false}
})
```

## Article Schema
```js
const ArticleSchema = new Schema({
    text: { type: String, required: true },
    author: { type: String, required: true },
    dateCreated: {type: Date , required: true},
    summary: { 
       summaryText: {type: String},
       biasAnalysis: {type: String},
       keywords: {type: String}
    },
    link: {type: String, required: false},
    comments:[
      {type: Schema.Types.ObjectId, ref: 'Comment'}
    ],
    topics: {type: [String], required: true}
})
```

## Comment Schema
```js
const CommentSchema = new Schema({
    text: { type: String, required: true },
    author: { type: String, required: true },
    dateCreated: {type: Date , required: true}
})
```


### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

- (GET) /login -> login page
- (POST) /register -> register page
- (GET) /articles -> trending page is shown
- (GET) /articles/personal -> personalized page is shown
- (POST) /articles/import -> imports an article that you want page 

## Queries

```js
router.get('/', async (req, res, next) => {
	try {
		const articles = await Article.find({}, {}).exec()
		res.send(articles)
	} catch (err) {
		logger.error(err)
		next(err)
	}
})
```

```js
router.get('/preferences:userID', async (req, res, next) => {
	User.findByID({"_id": req.params.userID})
   .then(user => {
      let userPreferences = user.preferences;
      Article.find({topics: {"$in": userPreferences} })
      .then(articles => {
         res.send(articles);
      })
   })
})
```

## Milestone 1
<img src='http://g.recordit.co/K57Xa5xRlW.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Milestone 2
<img src='http://g.recordit.co/JoPVx1VBwn.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
