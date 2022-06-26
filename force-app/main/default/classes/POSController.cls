public with sharing class POSController {
    List<quoteHelper__c> lista = new List<quoteHelper__c>();
    @AuraEnabled(cacheable=true)
    public static List<quoteHelper__c> buscar(String codigo) {
        List<Product2> idDeProducto = [select Id, Name, ExternalId, ProductCode from Product2 where ProductCode = :codigo limit 1];
        String idProducto = idDeProducto[0].Id;

        //Creamos el objeto helper para mostrar el item buscado.
        quoteHelper__c helper = new quoteHelper__c();
        helper.Name = idDeProducto[0].Name;
        helper.precioLista__c = String.valueOf([SELECT UnitPrice FROM PricebookEntry WHERE ProductCode = :codigo][0].UnitPrice);
        helper.idExterno__c	 = codigo;
        helper.cantidadDisponible__c = String.valueOf([Select Cantidad_dis__c from Inventario__c where CodigoProd__c =:codigo][0].Cantidad_dis__c);
        
        

        lista.add(helper);
        System.debug('Estoy dentro de buscar');
        return lista;
        //[SELECT Id, Name, precioLista__c, idExterno__c, cantidadDisponible__c FROM quoteHelper__c WHERE idExterno__c = :codigo limit 1];
   }

   @AuraEnabled(cacheable=true)
   public static List<quoteHelper__c> guardar(String cantidad) {

    return lista;






    }

}

