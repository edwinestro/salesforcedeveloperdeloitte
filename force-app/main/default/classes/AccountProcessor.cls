public with sharing class AccountProcessor {

    @future
    void static void  countContacts(Id[] Ids) {
        List<Account> accts = [SELECT Id, Number_Of_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN :Ids];
        
        for(Account a : accts){
******     a.Number_Of_Contacts__c = a.Contacts.size();               ******
        }
        
        update accts;
    }
}