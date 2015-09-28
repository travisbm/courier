#Dispatch

***

README describes how to interact with the Dispatch Rails app database.

#####Links

[Github repository for front end and design](https://github.com/ANnamdi/courier_hackathon_app)

[Link to app](https://dispatch-atx.herokuapp.com/)

###UML

***

![Alt Image Text](https://dl.dropbox.com/s/si5va5ho1i3a02l/dispatchdiagram.png?dl=0)

***

###Routes for Dispatch

_https://dispatch-atx.herokuapp.com_

**root: 		/jobs**
***

####HTTP Verb and path for User model

GET		/users

Returns a list of all users in the database.

POST		/users

Adds a new user to the users table

GET 		/users/:id

Returns the user record with the provided id

DELETE 	/users/:id

Deletes the user record with the provided id. Deletes all dependencies.

GET 		/users/:user_id/addresses

Returns the address record of the user with user_id

GET		/users/:user_id/jobs

Returns all jobs for the user with user_id and their addresses

POST 	/users/:user_id/jobs

Creates a job with the user_id provided

GET 		/users/:user_id/jobs/:id

Returns the job with the provided :id that also has the provided :user_id

***

####HTTP Verb and path for Messenger model

GET		/messengers

Returns all messengers

POST 	/messengers

Adds a new messenger to the messenger table

GET 		/messengers/:id

Returns the messenger record with the provided id

DELETE	/messengers/:id

Deletes the messenger record with the provided id. Deletes all dependencies.

GET 		/messengers/:messenger_id/jobs

Returns all jobs for the user with user_id and their addresses

***

####HTTP Verb and path for Jobs model

GET		/jobs

Returns a list of all jobs in the database

POST		/jobs

Adds a new job to the jobs table

GET 		/jobs/:id

Returns the job record with the provided id

DELETE	/jobs/:id

Deletes the job record with the provided id. Deletes all dependencies.

GET		/jobs/:job_id/addresses

Returns the address record of the job with job_id