import { LightningElement, wire } from 'lwc';
import buscar from '@salesforce/apex/POSController.buscar';
export default class lwcPOSxalapawok extends LightningElement {
    codigo = null; 
    cantidad = null; 
    @wire(buscar, { codigo: '$codigo' })
    items;
    handleChange(event) {
        this.codigo = event.detail.value;
    } 
    handleChange2(event) {
        this.cantidad = event.detail.value;
    }
    reset() {
        this.codigo = null;
    }
    
    add() {
        //To do
    }
}
