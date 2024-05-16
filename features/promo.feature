Test Scenario: Notification of Promotions for Regular Users
Given a promotion is active in the system
And the regular user is registered in the system with notifications enabled
When a new promotion is created or an existing promotion is updated
Then the system sends a notification to the regular user via email and/or push notifications 