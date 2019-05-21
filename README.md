# Brownfield Of Dreams
by Dream Team Tripod

Deployed site: https://turing-tutorials-1901.herokuapp.com/

This is the base repo for a brownfield project used at Turing for Backend Mod 3.

Project Spec and Evaluation Rubric: https://github.com/turingschool-examples/brownfield-of-dreams

## Objective and Learning Goals

This is the first time we have had a project where we did not start from scratch. The overarching goal is to get comfortable jumping into existing codebases, as that will be the majority of our careers.

Ruby skills we practiced included API calls, testing API's with VCR and WebMock, OAuth with Github, triggered emails with SendGrid, and RuboCop.

### About the Updated Website

Our site allows a logged-in user to connect to their Github account via OAuth. They can import a list of their followers, those whom they follow, and their repos to view on their dashboard. Followers who have valid Github emails can also be invited to join Turing Tutorials via email sent from the user's dashboard. New users who register will receive a confirmation email with a link that when clicked will activate their account. Admin can now add videos by updating a tutorial using the YouTube video ID.

We also identified various bugs from the original codebase including incorrectly named params, extraneous routes, unused methods, and flash messages. Bookmarks now show up on the user's dashboard as well.

Another main goal was to increase test coverage. It started around 70% and we increased coverage to 95%.

### About the Original Website

This is a Ruby on Rails application that organizes YouTube content for the purpose of online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment, they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

## Getting Started

### Requirements
Requires Ruby 2.4.1 and Rails 5.2.0

### API and Token setup

You will need to setup two API keys:
- Github defined within `ENV['GITHUB_TOKEN_KEY']`
- Youtube defined within `ENV['YOUTUBE_API_KEY']`

Setup a project client_id and client_secret on Github:
- client_id defined with `ENV['GITHUB_CLIENT_ID']`
- client_secret defined with `ENV['GITHUB_CLIENT_SECRET']`

Some tests are run with a dummy Github account to ensure email address could be found.
- Test Github defined within `ENV['TEST_KEY']`

SendGrid Email setup via Heroku:
Deploy project on Heroku to get user_name and password for SendGrid
- user_name defined within `ENV['SENDGRID_USERNAME']`
- password defined within `ENV['SENDGRID_PASSWORD']`

### Installing

Clone down the repo
```
$ git clone
```

Add to your Gemfile
```
$ gem 'figaro'
$ gem 'mailcatcher'
$ gem 'rubocop'
```

Install the gem packages
`$ bundle install`

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
`$ rake db:{create,migrate,seed}`

Run the test suite:
```ruby
$ bundle exec rspec
```

## Technologies
* [Figaro](https://github.com/laserlemon/figaro)
* [OmniAuth](https://github.com/omniauth/omniauth-github)
* [RubyCop](https://github.com/rubocop-hq/rubocop)
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)
* [SendGrid](https://sendgrid.com/)

## Authors
Carrie Walsh - https://github.com/carriewalsh
Erin King - https://github.com/erin-king
Jalena Taylor - https://github.com/jalena-penaligon/

We are a group of passionate back-end engineers who take joy in test-driven development and creating a positive user experience for our visitors, regardless of the minimum project requirements.
