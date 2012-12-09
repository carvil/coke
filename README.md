# Coke

Fetch tweets related to coca-cola

## Installation

There is a `bootstrap` script in the scripts directory, which will check for dependencies and guide you through
the installation process. You can run it with:

    ./script/bootstrap

If you choose not to run it (or it doesn't work as expected), you will find the detailed
instructions below.

This application uses `mongodb` (v2.2.2) as a data store, so you should install it before continuing.

Please note: you need to use `ruby 1.9.3` for this application, since the latest
`mongoid` driver fails under `ruby 1.9.2`.

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

There is an external dependency to run (some of) the specs: `phantomjs`.

You can find information on how to install it [here](http://phantomjs.org). In this case,
we need a specific version: `1.7.0`.

Once `phantomjs 1.7.0` is installed, you can run:

    bundle exec rspec

This command will run the entire test suite.

## Retrieving data

In order to fetch data from this application, one can query the following end-point:

    http://localhost:3000/tweets.json

This endpoint, when requested using `json` format, will return a list of all messages
stored by the system in `json` format. Here is an [example](https://gist.github.com/4247059).

It is also possible to retrieve messages for a specific user:

    http://localhost:3000/tweets/@coke_lvr.json

This will return the messages from `@coke_lvr`.
