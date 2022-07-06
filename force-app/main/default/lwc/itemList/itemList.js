import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Item__c.Name';
import precio from '@salesforce/schema/Item__c.Precio__c';
import getItems from '@salesforce/apex/ItemController.getItems';
const COLUMNS = [
    { label: 'Nombre de Producto', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Precio', fieldName: precio.fieldApiName, type: 'text' }
];
export default class itemList extends LightningElement {
    columns = COLUMNS;
    @wire(getItems)
    items;
}