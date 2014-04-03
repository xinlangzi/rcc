@jobs
Feature: Jobs
  In order to have jobs on my website
  As an administrator
  I want to manage jobs

  Background:
    Given I am a logged in refinery user
    And I have no jobs

  @jobs-list @list
  Scenario: Jobs List
   Given I have jobs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of jobs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @jobs-valid @valid
  Scenario: Create Valid Job
    When I go to the list of jobs
    And I follow "Add New Job"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 job

  @jobs-invalid @invalid
  Scenario: Create Invalid Job (without title)
    When I go to the list of jobs
    And I follow "Add New Job"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 jobs

  @jobs-edit @edit
  Scenario: Edit Existing Job
    Given I have jobs titled "A title"
    When I go to the list of jobs
    And I follow "Edit this job" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of jobs
    And I should not see "A title"

  @jobs-duplicate @duplicate
  Scenario: Create Duplicate Job
    Given I only have jobs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of jobs
    And I follow "Add New Job"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 jobs

  @jobs-delete @delete
  Scenario: Delete Job
    Given I only have jobs titled UniqueTitleOne
    When I go to the list of jobs
    And I follow "Remove this job forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 jobs
 