public with sharing class ContactOpportunityHandler {
    private Opportunity createOpportunity(Contact contact) {
        Date today = System.today();

        Opportunity opportunity = new Opportunity(
            Name = 'Oportunidade de Boas-Vindas - ' + contact.Name,
            CloseDate = today.addDays(30),
            StageName = 'Prospecting',
            AccountId = contact.AccountId
        );

        return opportunity;
    }

    private Boolean isValidAccount(Contact contact) {
        List<String> acceptedAccountTypes = new List<String>{'Customer - Direct', 'Customer - Channel'};
        
        if (acceptedAccountTypes.contains(contact.Account.Type)) return true;

        return false;
    }

    public void handleContactCreation(List<Contact> rawContacts) {
        List<Opportunity> opportunities = new List<Opportunity>();
        List<Contact> contacts = [SELECT Id, Name, AccountId, Account.Type FROM Contact WHERE Id IN :rawContacts];

        for (Contact contact : contacts) {
            if (contact.AccountId == null) continue;
            if (!isValidAccount(contact)) continue;

            opportunities.add(createOpportunity(contact));
        }

        try {
            insert opportunities;
            System.debug('Opportunities were created successfully! list size: ' + opportunities.size());
        } catch (Exception error) {
            System.debug('handleContactCreation ERROR > ' + error.getMessage());
        }
    }
}