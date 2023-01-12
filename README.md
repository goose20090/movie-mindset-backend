# Sinatra Based Backend for the Movie Mindset Review App

This is a web basic API, build with Sinatra and Active Record. It provides a backend to the [Movie Mindset Review App](https://github.com/goose20090/phase-3-project-frontend) which was partly designed to fulfil a set of passing criteria for the phase 3 project of Flatiron's Software Engineering Course.

For an outline of the user experience, please visit the repository for the [this project's frontend](https://github.com/goose20090/phase-3-project-frontend). This README will outline how this project fulfils the set requirements.

## Project Requirements for MovieMindSet Review App


1) *Use Active Record to interact with a database.*

    As can be seen in the controllers for this app, the models in the project use Active Record, combined with the Sinatra Gem to interact with its databases


2)  *Have at least two models with a one-to-many relationship.*

    -  Both the Movie and User models have a one-to-many relationship with the Review model.
    
    - Additionally, each Movie and User have a has-many relationship through the Review model.

3) *At a minimum, set up the following API routes in Sinatra: create and read actions for both models, full CRUD capability for one of the models.*

    - The Review model has full CRUD capability

    - The User and Movie models have read and create actions

4) *Build a separate React frontend application that interacts with the API to
  perform CRUD actions.*

    - The repository for this frontend can be found [here](https://github.com/goose20090/phase-3-project-frontend).

5) *Implement proper front end state management. You should be updating state using a
  setState function after receiving your response from a POST, PATCH, or DELETE 
  request. You should NOT be relying on a GET request to update state.*

    - As can be seen from the front-end repository, state setter functions have been used to update state, not GET requests.

6) *Use good OO design patterns. You should have separate classes for each of your
  models, and create instance and class methods as necessary.*

    - Separate classes have been made for each of the models which make use of appropriate class methods, many available via Active Record.


7) *Routes in your application (both client side and back end) should follow RESTful
  conventions.*

    - All routes have been designed in the intention of following RESTful conventions.


8) *Use your back end optimally. Pass JSON for related associations to the front 
  end from the back end. You should use active record methods in your controller to grab
  the needed data from your database and provide as JSON to the front end. You
  should NOT be relying on filtering front end state or a separate fetch request to
  retrieve related data.*

    - Associations between models have been included in the majority of back-end route responses, by the use of the include method in Active Record.

    - This avoids the need for multiple fetch requests to access related data.


## NOTES

- This backend generates placeholder data for the App via use of the [Faker Gem](https://github.com/faker-ruby/faker)