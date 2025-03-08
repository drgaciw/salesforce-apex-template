// This is a sample Apex script that you can use to test your org setup
// To execute: 1. Ensure you're authenticated to your org
//             2. Right-click this file in VS Code and select "SFDX: Execute Anonymous Apex"

// Print a simple message
System.debug('Hello World!');

// Get some basic org info
Organization org = [SELECT Name, InstanceName, OrganizationType FROM Organization LIMIT 1];
System.debug('Connected to org: ' + org.Name + ' (' + org.OrganizationType + ')');
System.debug('Instance: ' + org.InstanceName);

// Get current user info
User currentUser = [SELECT Name, Email FROM User WHERE Id = :UserInfo.getUserId()];
System.debug('Current user: ' + currentUser.Name + ' (' + currentUser.Email + ')');

// Test DML operations
Account testAccount = new Account(Name = 'Test Account');
insert testAccount;
System.debug('Created test account with Id: ' + testAccount.Id);
delete testAccount;
System.debug('Deleted test account');