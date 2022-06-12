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

        boolean existe = false;

        List<Product2> listaProd = [SELECT ID FROM Product2 WHERE CodigoProd__c= :codigo LIMIT 1];

        if(listaProd.size() > 0 ){
            existe = true;
        }
        return existe;
        }

    public double searchProductByCode(String codigo){

        double cantidad = 0;

        Inventario__c producto = [SELECT id, Cantidad_dis__c FROM Inventario__c WHERE CodigoProd__c = :codigo LIMIT 1];
        cantidad = producto.Cantidad_dis__c;
        return cantidad;
    }
    
}