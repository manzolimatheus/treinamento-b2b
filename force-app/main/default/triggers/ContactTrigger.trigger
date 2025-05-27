trigger ContactTrigger on Contact (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        new ContactOpportunityHandler().handleContactCreation(Trigger.new);
    }
}