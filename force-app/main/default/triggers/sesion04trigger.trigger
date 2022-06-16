trigger sesion04trigger on QuoteLineItem (after update, after insert) {
    
    QuoteLineItem qt = new QuoteLineItem();
    for(QuoteLineItem item:Trigger.New){
        qt = item;
    }

    System.debug('Cantidad en item '+qt.Quantity);
    System.debug(qt.Product2Id);

    for(Product2 each : [SELECT ProductCode from Product2 WHERE Id = :qt.Product2Id limit 1]){

        for(Inventario__c i : [SELECT id, Cantidad_apart__c, FROM Inventario__c WHERE CodigoProd__c = :each.ProductCode LIMIT 1]){

        i.Cantidad_apart__c += qt.Quantity;
        update i;

        }

    }

}