# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
intsall MySQL
sudo apt update
sudo apt install mysql-server

setup and start mysql with username root and password root


rails new test_takers -d mysql

cd ../test_takers
rails db:create
rails db:migrate
rails s