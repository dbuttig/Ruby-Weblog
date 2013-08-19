Feature: Post Creation
  As an author
  In order to provide content
  I want to be able to create new posts

Scenario: Unauthorized post creation
  Given I am not logged in
  When I go to create a new post
  Then I am asked to log in

Scenario: Authorized Post Creation
  Given I am logged in
  When I create a new post
  Then the post is shown
