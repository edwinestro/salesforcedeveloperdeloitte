trigger sesion04trigger on QuoteLineItem (after update, after insert) {
    
    QuoteLineItem qt = new QuoteLineItem();
    for(QuoteLineItem item:Trigger.New){
        qt = item;
    }

    System.debug('Cantidad en item '+qt.Quantity);
    System.debug(qt.Product2Id);

    
    List<Inventario__c> updatear = [SELECT id, Cantidad_apart__c FROM Inventario__c WHERE CodigoProd__c = :qt.Product2Id LIMIT 1];
        
    for(Inventario__c i : updatear){
    
    i.Cantidad_apart__c += qt.Quantity;
    update i;
    }
    }