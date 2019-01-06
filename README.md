# Introduction

The purpose of this system is to improve the account receivables and to mitigate the loss of financial liquidity by developing an innovative web application connecting organizations, start-up or people with the legal professionals. It allows the user to create a claim for the overdue debt that would acknowledge the legal professionals about the availability of claim in his region. Looking at the claim, legal professional can bid on the same accordingly.

# Ruby version
System uses ruby '~>2.4.1'   and  rails, '~> 5.2.0'

# Database creation
Relation Database used: postgres
use gem 'pg' # for postgres
For a new application,try using 'rake db:schema:load'.
However if the application is already exists try running the command 'rake db:migrate'


# How to run the test suite
The development follows test first code later process.
The test cases are implemented using Rspec in conjunction with capybara.
In order to run the test cases execute the command 'rspec' within the repository
It will run all the test cases

# IMPLEMENTATION

This covers the necessary steps to get the application up and running.

1. Install Ruby Version Manager (RVM), consider the link provided below for installation if needed
   https://rvm.io/
2. On successfully installing rvm install ruby version greater or equal '2.4.1'

3. Take a clone from github

4. Install postgres pg as the database for Active Record, consider the link provided below for installation if needed
  https://www.postgresql.org/

5. On successfully installing pg, run the following commands
  * rake db:create  #This would create a database for the application
  * rake db:migrate #This would alter your database schema over time in a consistent and easy way.

6. Run bundle command within the repository inorder to install all the gems (packages).

7. In order to set up the configurations, consider the following steps
  1. Create a application on the developers facebook, Consider the url below if required
    https://developers.facebook.com/. 
  2. On successful app creation add the information details followed by adding Valid OAuth Redirect URIs for example https://localhost:3000/users/auth/facebook(Note: you can remove localhost and your own application url)
  3. Copy the App ID and App Sectret

8. Create a .env file and add
  FB_APP_ID: YOUR APP ID
  FB_APP_SECRET: YOUR APP SECRET

9. This would setup the application

10. In order to verify, run rspec with the repository. This would run all the tests.

11. Within the repository, run rails s and start working



# Deployment instructions

The following steps were involved in deploying the code to the server.

1. Install Heroku on the system (Install-Heroku)

2. heroku create
The command creates a new empty application on Heroku, along with an associated empty ’Git
repository’.

3. heroku git: remote -a app name
Git remote command confirms that a remote named heroku has been set for our application.

4. git push heroku master
Git push command pushes the code from our local repository’s master branch to the heroku
remote.

5. On successful deployment, the authors added all the necessary environment variables for the heroku repo.

6. heroku run rake db: migrate –app name
This command was used to create database with all the migrations.
