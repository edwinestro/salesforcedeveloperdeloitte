public with sharing class InsumoController {
@AuraEnabled(cacheable=true)
public static List<Insumo__c> getInsumos() {
    return [
        SELECT Name, Stock__c
        FROM Insumo__c
        ORDER BY Name
    ];
    }

}