trigger sesion04trigger on QuoteLineItem (after insert) {


    //Solo se llama una vez puesto que solo se actualiza un quantity.
    for(QuoteLineItem quote : trigger.new){

//Se guarda el item de inventario desde su CodigoProd__c para acceder a su cantidad_apart__c y actualizarlo.
    String  vartemp = quote.Product2.ProductCode;
    List<Inventario__c> itemToUpdate = [select CodigoProd__c, cantidad_apart__c  
    from Inventario__c 
    where CodigoProd__c = :vartemp
    limit 1];

    //Añadimos la nueva cantidad apartada a la cantidad apartada en inventario.

    for(QuoteLineItem every : itemToUpdate){

    every.cantidad_apart__c += quote.Quantity;
    }

}
}