public with sharing class CustomWebInventoryController {
        private final sObject parent ;
        public String codigo {get;set;}
        public Integer cantidad {get;set;}
        public Integer precioVenta {get;set;}
        public List<quoteHelper__c> listInv {get;set;}

        public CustomWebInventoryController(ApexPages.StandardController controller){
            parent = controller.getRecord();
        }

        //Crea un objeto quoteHelper__c para poder mostrar la informacion
        public void buscar(){
            List<Product2> idDeProducto = [select Id, Name, ExternalId, ProductCode from Product2 where ProductCode = :codigo limit 1];
            String idProducto = idDeProducto[0].Id;

            //Eliminamos los objetos existentes de quoteHelper__c para que nos muestre el obeto deseado.
            List<quoteHelper__c> borrable = [select Id from quoteHelper__c ];
            delete borrable;

            //Creamos el objeto helper para mostrar el item buscado.
            quoteHelper__c helper = new quoteHelper__c();
            helper.Name = idDeProducto[0].Name;
            helper.precioLista__c = String.valueOf([SELECT UnitPrice FROM PricebookEntry WHERE ProductCode = :codigo][0].UnitPrice);
            helper.idExterno__c	 = codigo;
            helper.cantidadDisponible__c = String.valueOf([Select Cantidad_dis__c from Inventario__c where CodigoProd__c =:codigo][0].Cantidad_dis__c);
            insert helper;
            listInv = Database.query('SELECT Name, precioLista__c, idExterno__c, cantidadDisponible__c FROM quoteHelper__c WHERE idExterno__c = :codigo limit 1');
        }






        public void limpiar(){
            listInv.clear();
        }        






        public void guardar(){

            //Obtenemos el Id del Quote que estamos trabajando.
            Comanda_Item__c nuevoItem = new Comanda_Item__c();
            nuevoItem.Codigo_de_Producto__c = codigo;
            nuevoItem.Cantidad__c = cantidad;
            nuevoItem.Precio__c = precioVenta;
            insert nuevoItem;
        }


        public void back(){


            //insert nuevoItem;
            listInv.clear();
        }

    }