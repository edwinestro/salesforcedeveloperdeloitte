public with sharing class ItemController {
@AuraEnabled(cacheable=true)
public static List<Item__c> getItems() {
    return [
        SELECT Name, Precio__c
        FROM Item__c
        WITH SECURITY_ENFORCED
        ORDER BY Name
    ];
}

}