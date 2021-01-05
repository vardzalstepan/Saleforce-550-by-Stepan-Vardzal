public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            ORDER BY LastName
        ];
    }
    @AuraEnabled
    public static string insertAccount(){
        try{
        // a required field is missing
        insert new Account();
        }
        catch(Exception e){

            System.debug(Logginglevel.ERROR, e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }

        return null;
    }
}
 