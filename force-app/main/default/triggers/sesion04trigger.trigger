trigger sesion04trigger on QuoteLineItem (after insert) {


    QuotationHelper sesion04 = new QuotationHelper();
    
    for(QuoteLineItem quote : trigger.new){
        quote.Inventario__r.Cantidad_apart__c += sesion04.searchProductByCode(quote.Product2.ProductCode);
    }

//Se llama al item de inventario desde su CodigoProd__c para acceder a su cantidad_dis__c y actualizarlo.

Inventario__c itemToUpdate = [select CodigoProd__c from Inventario__c where CodigoProd__c = quote.Product2.ProductCode limit 1];

itemToUpdate.cantidad_apart__c += 


}