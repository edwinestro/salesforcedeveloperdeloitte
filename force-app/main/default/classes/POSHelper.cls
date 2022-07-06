public with sharing class POSHelper {

    public POSHelper(){

    }

    public List<Insumo__c>  descontarInsumos(String code){
        List<Insumo__c> insumos = new List<Insumo__c>();

       
        if(code == 'cw01'){                         //After evaluating the code,
            insumos = [                             //the used Ingredients in the inventory are queried.
                SELECT Id, Name, Stock__c          
                FROM Insumo__c                    
                WHERE Name = 'Paquete de Camarones' OR Name = 'Paquete de Noodles'              
                    OR Name = 'Caja' OR Name = 'Paquete de Verduras' OR Name = 'Palillos'       
        ];

            
        for(Insumo__c insumo: insumos ){
            insumo.Stock__c -= 1;                       //For each subItem we substract 1 from its Stock property.
            }


        }
        return insumos;
    }
}