@ads
Feature: Ads
  In order to have ads on my website
  As an administrator
  I want to manage ads

  Background:
    Given I am a logged in refinery user
    And I have no ads

  @ads-list @list
  Scenario: Ads List
   Given I have ads titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of ads
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @ads-valid @valid
  Scenario: Create Valid Ad
    When I go to the list of ads
    And I follow "Add New Ad"
    And I fill in "Link" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 ad

  @ads-invalid @invalid
  Scenario: Create Invalid Ad (without link)
    When I go to the list of ads
    And I follow "Add New Ad"
    And I press "Save"
    Then I should see "Link can't be blank"
    And I should have 0 ads

  @ads-edit @edit
  Scenario: Edit Existing Ad
    Given I have ads titled "A link"
    When I go to the list of ads
    And I follow "Edit this ad" within ".actions"
    Then I fill in "Link" with "A different link"
    And I press "Save"
    Then I should see "'A different link' was successfully updated."
    And I should be on the list of ads
    And I should not see "A link"

  @ads-duplicate @duplicate
  Scenario: Create Duplicate Ad
    Given I only have ads titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of ads
    And I follow "Add New Ad"
    And I fill in "Link" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 ads

  @ads-delete @delete
  Scenario: Delete Ad
    Given I only have ads titled UniqueTitleOne
    When I go to the list of ads
    And I follow "Remove this ad forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 ads
 