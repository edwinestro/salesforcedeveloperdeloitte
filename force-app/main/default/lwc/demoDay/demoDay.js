import { LightningElement, wire } from 'lwc';
import buscar from '@salesforce/apex/POSController.buscar';
import guardar from '@salesforce/apex/POSController.guardar';
export default class demoDay extends LightningElement {
    codigo = null; 
    cantidad = null; 
    @wire(buscar, { codigo: '$codigo' })
    items;    
    @wire(guardar, {codigo: '$codigo' })
    items2;
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
        this.cantidad = 1;
    }
}
