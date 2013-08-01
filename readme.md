# MoarData

This is a simple data gathering application that stores categorised text in MongoDB for transfer to Google Cloud Storage. It relates to a blog post on the subject I wrote for the SendGrid blog [url coming soon]

## Installation

1. Clone the repo to your local machine.

2. From the folder run the following commands

```
$ heroku create moardata
$ git push heroku master
```
3. Then add the MongoHQ add on, so you have somewhere to store the data. The app is set up to look for an environment variable called MONGOHQ_URL. This will be set when you run this command:
```
$ heroku addons:add mongohq:sandbox

4. Launch the app
```
$ heroku ps:scale web=1
```