public with sharing class NominationSelectionControler {
    @AuraEnabled (cacheable = true)
   public static List<Contact> getContactList(String queryTerm) {
       System.debug(queryTerm);
    List<Contact> contacts = (Contact[]) [FIND :queryTerm IN NAME FIELDS RETURNING Contact(FirstName,LastName,Department)][0];
        System.debug(contacts);
        return contacts;
   }

   @AuraEnabled
   public static void createNominee (Id nominationId, Id contactId) {
       CandidateNomination__c newNominee = new CandidateNomination__c( NominationId__c = nominationId, Nominees__c = contactId);
   }
}
