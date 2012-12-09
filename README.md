# Coke

Fetch tweets related to coca-cola

## Installation

This application uses `mongodb` as a data store, so you should install it before continuing.

Once `mongodb` is installed, you should install bundler:

    gem install bundler

And then install the dependencies:

    bundle install

At this point, you are ready to run the application.

## Running the application

In order to run the application, start the server:

    bundle exec rails s

And then go to:

    http://localhost:3000

Where you will find the app.

## Running specs

There is an external dependency to run the specs: `phantomjs`.

You can find information on how to install it [here](http://phantomjs.org).

Once phantomjs is installed, you can run:

    bundle exec rspec

This command will run the entire test suite.

## Considerations

TODO
