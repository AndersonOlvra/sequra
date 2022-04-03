# README

* Hot to config
    - Ruby version 2.7.0
    - `bundle install` to install all gems
    - `rake db:migrate` to run all migrations

* Runing the taks
    - To execute the Imports task first go to `http://localhost:3000/imports` and import all of yours csvs choosing the correct type, after it you can run `rake import:data` and if you refresh the screen when task finishe you will see the status of the Imports change to finished
    - To execute the Calculate task you can run `rake calculate:disbursements` and the orders that have completed date and were created at the current week will be calculated, than you can see the result in the Disbursements API `http://localhost:3000/api/v1/disbursements`
    - In the Disbursements API you can see all disbursements or search by a merchant `http://localhost:3000/api/v1/disbursements?merchant=Flatley-Rowe`

* Short explanation about technical choices
    - I chose not to do anything on the frontend because of time but if I had a little more time I would like to at least put a slightly better template
    - I chose to import the csvs in a background task because depending on the size of the file it could take some time
    - I just put really simple test as an example to avoid running out of time, sorry for it
    - If I had more time I would also like to add authentication to the system and allow the use of the api through OAuth authentication
    - The tasks can be executed using sidekiq or Heroku schedule task for example, this way they can be executed every Monday but I ended up choosing not to do it because of time too
