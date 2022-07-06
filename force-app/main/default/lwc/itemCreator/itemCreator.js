import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Item__c';
import itemcode from '@salesforce/schema/Item__c.itemcode__c';
import comanda from '@salesforce/schema/Item__c.Comanda__c';
export default class contactCreator extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    fields = [itemcode, comanda];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Item creado",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}