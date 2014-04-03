@topics
Feature: Topics
  In order to have topics on my website
  As an administrator
  I want to manage topics

  Background:
    Given I am a logged in refinery user
    And I have no topics

  @topics-list @list
  Scenario: Topics List
   Given I have topics titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of topics
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @topics-valid @valid
  Scenario: Create Valid Topic
    When I go to the list of topics
    And I follow "Add New Topic"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 topic

  @topics-invalid @invalid
  Scenario: Create Invalid Topic (without title)
    When I go to the list of topics
    And I follow "Add New Topic"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 topics

  @topics-edit @edit
  Scenario: Edit Existing Topic
    Given I have topics titled "A title"
    When I go to the list of topics
    And I follow "Edit this topic" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of topics
    And I should not see "A title"

  @topics-duplicate @duplicate
  Scenario: Create Duplicate Topic
    Given I only have topics titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of topics
    And I follow "Add New Topic"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 topics

  @topics-delete @delete
  Scenario: Delete Topic
    Given I only have topics titled UniqueTitleOne
    When I go to the list of topics
    And I follow "Remove this topic forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 topics
 