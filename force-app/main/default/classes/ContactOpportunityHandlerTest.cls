@isTest
private class ContactOpportunityHandlerTest {

    @isTest
    static void contactCreationShouldGenerateOpportunity() {
        Account account = new Account(
            Name = 'Test Account',
            Type = 'Customer - Direct'
        );

        insert account;

        Contact contact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            AccountId = account.Id
        );

        insert contact;

        System.Assert.isTrue(
            [SELECT Id FROM Opportunity].size() == 1
        );
    }

    @isTest
    static void contactCreationShouldNotGenerateOpportunity() {
        Account account = new Account(
            Name = 'Test Account',
            Type = 'Other'
        );

        insert account;

        Contact contact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            AccountId = account.Id
        );

        insert contact;

        System.Assert.isTrue(
            [SELECT Id FROM Opportunity].size() == 0
        );
    }
}