# Introduction

The mission is to improve the account receivables and to mitigate the loss of financial liquidity by developing an innovative system connecting organizations, start-up or people with the legal professionals. It allows the user to create a claim for the overdue debt that would acknowledge the legal professionals about the availability of claim in his region. Looking at the claim, legal professional can bid on the same accordingly.

# Ruby version
System uses ruby '~>2.4.1'   and  rails, '~> 5.2.0'

# Database creation
Relation Database used: postgres
use gem 'pg' # for postgres
For a new application,try using 'rake db:schema:load'.
However if the application is already exists try running the command 'rake db:migrate'

# Configuration

# Deployment instructions

# How to run the test suite
The development follows test first code later process.
The test cases are implemented using Rspec in conjunction with capybara.
In order to run the test cases execute the command 'rspec' within the repository
It will run all the test cases