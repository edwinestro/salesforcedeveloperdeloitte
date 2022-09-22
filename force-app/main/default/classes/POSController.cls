public with sharing class POSController {
    @AuraEnabled(cacheable=true)
    public static List<Lista_de_Precios__c> buscar(String codigo) {


        List<Lista_de_Precios__c> lista = new List<Lista_de_Precios__c>();

        Lista_de_Precios__c helper = new Lista_de_Precios__c();

        helper.Name = [Select Name from Lista_de_Precios__c Where codigoprod__c = :codigo limit 1][0].Name;
        helper.codigoprod__c = [Select codigoprod__c from Lista_de_Precios__c Where codigoprod__c = :codigo limit 1][0].codigoprod__c;
        helper.Precio__c = [Select Precio__c from Lista_de_Precios__c Where codigoprod__c = :codigo limit 1][0].Precio__c;



        lista.add(helper);
        System.debug('Estoy dentro de buscar');
        return lista;
   }

   
   @AuraEnabled(cacheable=true)
   public static List<Item__c> guardar(String codigo, String cantidad) {


       List<Item__c> lista = new List<Item__c>();

       Item__c helper = new Item__c();

       helper.Name = [Select Name from Item__c Where itemcode__c = :codigo limit 1][0].Name;
       helper.itemcode__c = [Select itemcode__c from Item__c Where itemcode__c = :codigo limit 1][0].itemcode__c;
       helper.Precio__c = [Select Precio__c from Item__c Where itemcode__c = :codigo limit 1][0].Precio__c;



       lista.add(helper);
       System.debug('Estoy dentro de guaradr');
       return lista;
  }

   //@AuraEnabled(cacheable=true)
   //public static List<item__c> guardar(String codigo, String cantidad) {



    
   // return lista;






    }