# Widget
## Requirements

### Dependencies

  * Ruby 2.6.2 
  * Node 12.16.1
  * Yarn
  * Rails 6.0.0
  * Postgres
  
## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `bundle install`
* `yarn install`
* `rails db:create` after setting up your database, though you wouldn't be using it but you need to set it up, after install Postgres
 

 ## Running / Development
  - Ensure you have the technologies/dependencies installed then all  the other steps are followed
 -  Setup *client_id* and *client_secret* environment variables in you config/.env.yml file, the .env.yml file doesn't exit so you will have to create it.
 -  If the above is setup you can test the app by running <code> rails s </code> and going to http://localhost:8080 to test the app

 ## Testing
  - In order to run the suite in its entirety:

* `rspec`
 
  


