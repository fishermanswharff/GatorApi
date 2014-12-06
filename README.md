[![Build status][ci-image]][ci-url] [![Code Climate][cc-climate-image]][cc-climate-url] [![Test Coverage][cc-coverage-image]][cc-coverage-url]

# Gator API

API for Gator, a social and news aggregator. Root: [https://gatorapi.herokuapp.com](https://gatorapi.herokuapp.com)

Endpoints: 

    users   GET    /users(.:format)     users#index
            POST   /users(.:format)     users#create
    user    GET    /users/:id(.:format) users#show
            PATCH  /users/:id(.:format) users#update
            PUT    /users/:id(.:format) users#update
            DELETE /users/:id(.:format) users#destroy
    login   POST   /login(.:format)     users#login
    logout  GET    /logout(.:format)    users#logout

## Create a new user:

      post '/users',
      { user:
        { first_name: 'far', last_name: 'boo', username: 'farboo', role: 'generic', email: 'foz@baz.com', password: 'secret'}
      }

      expect(response.status).to eq 201
      user = JSON.parse(response.body)
      expect(user_url(user[:id])).to eq response.location

## Update an existing user: 

      patch "/users/#{@user.id}",
      { user: 
        { first_name: 'jason', last_name: 'wharff', role: 'admin', password: 'secret' }
      }
      expect(response.status).to eq 200
      expect(response.body[:first_name]).to eq 'jason'

## Login

      post '/login',{ username: "foo", password: "secret" }
      expect(response.status).to eq 200
      expect(response.content_type).to eq Mime::JSON


## Wish List

* Token authentication :ballot_box_with_check:
* Multiple oAuth Providers
* Image urls pulled from feeds
* Featured image for RSS feeds
* Background workers to update feeds
* Redis-based caching for oAuth provider feeds
* Background workers to update oAuth provider feeds
* User-curated magazines
* Admin-only dashboard for site analytics
  * user count
  * user information
  * feeds

Installation
--------
This app requires multiple API keys: 

* Twitter
* LinkedIn, with permissions to read (and write) network updates (rw_nus)
* Instagram

Gator looks for environment variables with these names:

      TWITTER_CONSUMER_KEY
      TWITTER_CONSUMER_SECRET
      INSTAGRAM_CLIENT_ID
      INSTAGRAM_CLIENT_SECRET
      LINKEDIN_KEY
      LINKEDIN_SECRET_KEY

Wireframes and schema preparation:
----------------
![wireframes and schema](/docs/whiteboard-notes.jpg "Whiteboard notes")


[ci-image]: https://travis-ci.org/fishermanswharff/GatorApi.svg?branch=master
[ci-url]: https://travis-ci.org/fishermanswharff/GatorApi

[cc-climate-image]: https://codeclimate.com/github/fishermanswharff/GatorApi/badges/gpa.svg
[cc-climate-url]: https://codeclimate.com/github/fishermanswharff/GatorApi

[cc-coverage-image]: https://codeclimate.com/github/fishermanswharff/GatorApi/badges/coverage.svg
[cc-coverage-url]: https://codeclimate.com/github/fishermanswharff/GatorApi