public with sharing class QuotationHelper {
    public QuotationHelper() {

    }

    public void initialConfig(){

        Account cuenta1 = new Account();
        cuenta1.Name = 'Compumundo';
        insert cuenta1;

        Account cuenta2 = new Account();
        cuenta2.Name = 'Compuworld';
        insert cuenta2;
        
    }

    public List<Inventario__c> productsInInventory(){

        return [select Name from Inventario__c];
        
    }

}