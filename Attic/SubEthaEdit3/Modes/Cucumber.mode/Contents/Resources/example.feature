Feature: Multiple site support
  As a Mephisto site owner
  I want to host blogs for different people
  In order to make gigantic piles of money

  Background:
    Given a global administrator named "Greg"
      And a blog named "Greg's anti-tax rants"
      And a customer named "Dr. Bill"
      And a blog named "Expensive Therapy" owned by "Dr. Bill"

  Scenario: Dr. Bill posts to his own blog
    Given I am logged in as Dr. Bill
    When I try to post to "Expensive Therapy"
    Then I should see "Your article was published."
      But I should not see "Thank You"

  Scenario: Dr. Bill tries to post to somebody else's blog, and fails
    Given I am logged in as Dr. Bill
    When I try to post to "Greg's anti-tax rants"
    Then I should see "Hey! That's not your blog!"
    
  Scenario: Given with then
    Given I am testing with then
    Then the then should be purple

  Scenario: Greg posts to a client's blog
    Given I am logged in as Greg
    When I try to post to "Expensive Therapy"
    Then I should see /Your article was published\./ within "/ul a"
    
  Scenario: Testing keywords
    Given I am testing keywords
      And I am using Coda
      But I am not drinking coffee
    When I look at a Cucumber file
      And I am testing And
      But I am also testing But
    Then the And and But keywords should match the parent color
      And I will be happy
      But I will not be finished

  Scenario Outline: drinking
    Given there are <start> bottles
    When I eat <drink> bottles
    Then I should have <left> bottles
  
    Scenarios:
      | start | drink | left |
      |  12   |  5    |  7   |
      |  20   |  5    |  15  |

  # work in progress      
  @wip    
  Scenario Outline: eating
    Given there are <start> cucumbers
    When I eat <eat> cucumbers
    Then I should have <left> cucumbers
  
    """
    I need to rethink these examples
    """
    Examples:
      | start | eat | left |
      |  12   |  5  |  7   |
      |  20   |  5  |  15  |
      
  Scenario: Given with tag after
    Given I have a tag later
      
  @tag
  Scenario: Given on last line
    Given I am a crazy dude