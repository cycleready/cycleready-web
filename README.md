#CycleReady
This is the GitHub repo for the [CycleReady](http://www.cycleready.com) project.

Check out the live version at [cycleready.herokuapp.com](https://cycleready.herokuapp.com)

When you first start biking in San Francisco, you probably rely heavily on Google maps to navigate. Once you've biked here for a little while you realize you only need to remember a few routes and you use them all the time.  The purpose of CycleReady is to highlight those routes and share them with everyone else.

##Helping Out
This is a project of the Code for America [San Francisco Brigade](https://github.com/sfbrigade).  Go ahead and make a fork and hack away!

###Do you know about ... 
* [Ruby on Rails](http://rubyonrails.org/)?
* [Bootstrap](http://getbootstrap.com) (especially mobile-oriented)?
* Maps (especially [Mapbox](http://www.mapbox.com))?
* Drawing cool artwork?
* Researching things on the interwebs?
* Biking around San Francisco?

*Do you want to learn?*

We could probably use your help!

##Getting Started

###Rails
This is a Ruby on Rails app, if you're not familiar with Rails, here's a few steps to get you started locally:

####The first time:

*Open a terminal*

*Do you have Ruby?*  Type `$ ruby -v` (omitting the `$`). You should see something like: ` ruby 2.1.6p336`  Don't have Ruby? [Install using the instructions here](https://www.ruby-lang.org/en/installation/).

*Do you have SQLite3?* Type `$ sqlite3 --version` You should see a string of numbers and letters.  Otherwise, you [should use the instructions here](https://www.sqlite.org/).

*Do you already have Rails installed?*  Type `$ rails -v`  If you see something like ` Rails 4.2.1` that means you do.  If you don't, type `$ gem install rails` to install rails.

*Fork this repo.* If you don't already know how to do this, [start with this article](https://help.github.com/articles/set-up-git/).

*Switch to the `develop` branch* `$ git checkout develop` if you're not already there.

*Almost there!*  Your local database isn't set up yet, so run `$ rake db:setup`, `$rake data:load_routes`, and `$rake data:connect_routes_to_neighborhoods`


*Start the rails server* by typing `$ rails s` 

*Open your browser* and go to [http://localhost:3000](http://localhost:3000)

**You are GTG**

####The steps you'll repeat:
*Open a terminal*

*Go to your local repo* `$ cd path/to/my/local/cycleready`

*Start the rails server* `$ rails s` 

*Open your browser* to [http://localhost:3000](http://localhost:3000)

Most of these instructions were adapted from [the official Rails Guides](http://guides.rubyonrails.org/getting_started.html).

##Git and git-flow

We're trying to use the [gitflow workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) .  That means the `master` branch is always deployable.

To work on a new feature, create a new branch off of `develop`

Work on that feature, then create a pull request to `cycleready-web/develop`

We'll review, then merge into `develop`.  When there are enough features, we'll pull `develop` into `master` and it'll deploy to heroku and be live.
