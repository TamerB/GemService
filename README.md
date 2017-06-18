This is a Ruby on Rails REST API that responds to 1. GET request to get system libraries needed for certain dependencies. and 2. POST request to post needed system libraries required for a certain dependency

* Ruby version : 5.1.1

* Configuration:

    $ bundle install

if bundle install is not working, you can execute the following command first:

    $ gem install rails

* Database configuration

Edit database username and password in config/database.yml. The execute the following commands

    $ rake db:create
    $ rake db:migrate

* Run the application

    $ rails s
