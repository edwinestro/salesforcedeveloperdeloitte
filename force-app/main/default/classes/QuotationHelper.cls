public with sharing class QuotationHelper implements QuotationSync  {
    public QuotationHelper(){
    

    }

    public void initialConfig(){
        //Creacion e inserción de dos cuentas distintas.
        Account cuenta1 = new Account();
        cuenta1.Name = 'Compumundo';
        insert cuenta1;

        Account cuenta2 = new Account();
        cuenta2.Name = 'Compuworld';
        insert cuenta2;
        
    }
    //Retorna lista de items de inventario por sus nombres.
    public static List<Inventario__c> productsInInventory(){

        return [select Name from Inventario__c];
        
    }
    //Confirma la existencia de producto pasándole al método un código ProductCode
    public boolean confirmProductExistByCode(String codigo){

        boolean existe = false;

        List<Product2> listaProd = [SELECT ID FROM Product2 WHERE ProductCode= :codigo LIMIT 1];

        if(listaProd.size() > 0 ){
            existe = true;
        }
        return existe;
        }
    //Retorna la cantidad de producto disponible
    public static double searchProductByCode(String codigo){

        double cantidad = 0;

        List<Inventario__c> producto = [SELECT id, Cantidad_dis__c FROM Inventario__c WHERE CodigoProd__c = :codigo LIMIT 1];

        for(Inventario__c cada : producto){
        cantidad = cada.Cantidad_dis__c;
   
    }
    return cantidad;
    }

    //Método invocable para postear en Chatter
    @InvocableMethod
    public static void  StockEmptyAlert(){

        boolean condicionante = false;
        List<Inventario__c> inventariosARevisar = productsInInventory();

        for(Inventario__c inventarios : inventariosARevisar){

            if( searchProductByCode(inventarios.CodigoProd__c) == 0){
                condicionante = true;
            }
        }

        if(condicionante == true){

            //Schedule Stock Alert Post to Chatter
            PostToChatter alert = new PostToChatter();
            // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
            String sch = '0 */5 * * * ?';
            String jobID = System.schedule('Periodic Stock Alert', sch, alert);
        }



    }

    public void updateReservedQuantity(String Id,Integer Qty){

        List<Inventario__c> updatear = [SELECT id, Cantidad_apart__c FROM Inventario__c WHERE CodigoProd__c = :Id LIMIT 1];
        
        for(Inventario__c i : updatear){
        
        i.Cantidad_apart__c += Qty;
        update i;
        }

    }
    
}