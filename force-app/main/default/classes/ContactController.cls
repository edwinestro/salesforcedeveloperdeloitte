public with sharing class ContactController {
@AuraEnabled(cacheable=true)
public static List<Item__c> getContacts() {
    return [
        SELECT Name, Precio__c
        FROM Item__c
        WITH SECURITY_ENFORCED
        ORDER BY Name
    ];
}

}