trigger EnoughtoReserve on QuoteLineItem (before insert) {
    List<Product2> prod = [Select ProductCode from Product2 where Id = :Trigger.new[0].Product2Id limit 1];
    List<Inventario__c> inv = [Select Cantidad_dis__c from Inventario__c WHERE CodigoProd__c = :prod[0].ProductCode limit 1];
    if(Trigger.new[0].Quantity > inv[0].Cantidad_dis__c){
        Trigger.new[0].Quantity.addError('Quantity cannot be higher than available');
    }
}