import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Insumo__c.Name';
import STOCK_FIELD from '@salesforce/schema/Insumo__c.Stock__c';
import getInsumos from '@salesforce/apex/InsumoController.getInsumos';
const COLUMNS = [
    { label: 'Nombre de Insumo', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Stock', fieldName: STOCK_FIELD.fieldApiName, type: 'number' }
];
export default class insumoList extends LightningElement {
    columns = COLUMNS;
    @wire(getInsumos)
    insumos;
}