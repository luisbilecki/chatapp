# ChatApp

This repository contains a chat app created using Rails 5, ActionCable, and Devise.
It was developed based on the tutorial (https://www.sitepoint.com/create-a-chat-app-with-rails-5-actioncable-and-devise/) with some adjustments and changes.

--------------

## Dependencies

This app is docker based. To run you should have `docker` and `docker-compose`
installed in your machine.

If you don't want install these softwares, you should install some dependencies:

* Ruby (>= 2.4);
* Rails (= 5.1.4);
* Postgres (>= 9.2);
* PhantomJS (>= 2.11) - Used to run capybara tests.
--------------

## Usage

Clone this repository: `git clone https://github.com/luisbilecki/chatapp.git`.

In the repository folder, run:

* `docker-compose build`;
* `docker-compose run --rm web rails db:create`;
* `docker-compose run --rm web rails db:migrate`;
* `docker-compose run --rm web rspec`.

If `rspec` finishes without errors, you're ready to start the app. Run `docker-compose up`  and access `http://localhost:3000`.
