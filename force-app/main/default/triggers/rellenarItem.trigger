trigger rellenarItem on Item__c (before insert) {


//Read the itemCode and assign Name and Price from Price Book.
if(Trigger.new[0].itemcode__c == 'cw01'){


    for(Item__c item: Trigger.new){
        String codigo = 'cw01';
        Lista_de_Precios__c fuente = [
            SELECT Name, Precio__c 
            FROM Lista_de_Precios__c 
            WHERE codigoprod__c = :'cw01' 
            LIMIT 1][0];
        item.Name = fuente.Name;
        item.Precio__c = fuente.Precio__c;
    }
    
    POSHelper helper = new POSHelper();

    //Substract Ingredients Stock value by 1
    update helper.descontarInsumos('cw01');


    }















}


