# MoarData

This is a simple data gathering application that stores categorised text in MongoDB for transfer to Google Cloud Storage.

## Installation

1. Clone the repo to your local machine

2. From the folder run the following commands

```
$ heroku create moardata
$ heroku addons:add mongohq:sandbox
$ heroku ps:scale web=1
```