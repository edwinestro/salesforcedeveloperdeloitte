public with sharing class QuotationHelper implements QuotationSync  {
    public QuotationHelper(){
    

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

    public boolean confirmProductExistByCode(String codigo){

        if( null == [select ExternalId from Product2 where ProductCode = :codigo ] ) {

            return false; 

        }else{

            return true;
        }
    }

    public integer searchProductByCode(String codigo){

        if( null != [select Cantidad_dis__c	 from Inventario__c
        where CodigoProd__c = :codigo] ) {

            return Integer.valueOf([select Cantidad_dis__c	 from Inventario__c
            where CodigoProd__c = :codigo][0].Cantidad_dis__c); 

        }else{

            return 0;
        }

    }
}