# Practice Problem Portal
[![Build Status](https://travis-ci.org/yujuncho7/practice-problem-portal.svg?branch=master)](https://travis-ci.org/yujuncho7/practice-problem-portal)
[![Code Climate](https://codeclimate.com/github/yujuncho7/practice-problem-portal/badges/gpa.svg)](https://codeclimate.com/github/yujuncho7/practice-problem-portal)
[![Test Coverage](https://codeclimate.com/github/yujuncho7/practice-problem-portal/badges/coverage.svg)](https://codeclimate.com/github/yujuncho7/practice-problem-portal)

# Description
An easy web interface for students to complete practice problems and for administrators to create practice problems.
Details on the client's goals can be found [here](https://www.youtube.com/watch?v=LdUqu0n-T9o)

# Getting Started
Our CS169 course used `ruby '1.9.3'` and `rails '3.2.16'`; problems may occur if you are using an older or newer version.
run `bundle install`. Be sure to also `rake db:setup` to have migrations and test prepare ready to go.

Run `rails server` and enjoy your practice problem portal!

# Documentation

## Gems
1. [devise](https://github.com/plataformatec/devise)
2. [bootstrap](https://github.com/seyhunak/twitter-bootstrap-rails)
3. [redcarpet](https://github.com/vmg/redcarpet)
4. [jquery-datatables-rails](https://github.com/rweng/jquery-datatables-rails)
5. [ransack](https://github.com/activerecord-hackery/ransack)
6. [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
7. [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)

## Problems
1. Model
  * Title, Tags, Difficulty, Description, Solution
2. View
  * Index and show
3. Controller
  * Problems can only be created and modified by Instructors
  * Problems can be viewed and completed by Students


## Students
1. Model
  * Email and a hash of completed problems
2. View
  * Can view profile page to see current progress on problems
3. Controller
  * Can complete problems after checkmarking completed and hitting save
  * Signup from devise


## Instructors
1. Model
  * Email
2. View
  * Can create or modify problems
  * Can view list of all students as well as their progress
3. Controller
  * Signup from devise

# Testing
## Rspec
Most coverage completed from rspecs. Tests can be found under /spec
## Cucumwhat
Our group wrote tests for our features, but considering most features were taken from using gems
that have been tested already, there was no need to write such tedious tests. Great Coverage was achieved
through rspecs.
