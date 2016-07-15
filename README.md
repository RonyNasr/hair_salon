# Hair Salon
Ruby project week-3 Epicodus. using Database, and Sinatra

## Getting Started

to view the app please click on the below URL:
(https://enigmatic-retreat-63908.herokuapp.com/)

### Prerequisities

* Ruby 2.2.0 and above
* Postgres SQL
* Console
* Bundle

### Installing

To install this project you will need to follow the below steps:

* Run Postgres SQL
* Run the below to in psql:

_CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_salon_test;_

* Clone or download the project to your desktop
* Open Terminal
* navigate to project folder
* Run _bundle_ in Terminal
* Run _ruby app.rb_ in Terminal
* open a browser
* navigate to (http://localhost:4567/)

## Running the tests

To run the tests you will need to follow the below steps:

* Open a Terminal
* navigate to project folder
* run _rspec_

## Built With

* Ruby
* Sinatra
* Atom
* Heroku
* Postgres

## Authors

**Rony Nasr** - *Initial work* - [RonyNasr](https://github.com/RonyNasr)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
