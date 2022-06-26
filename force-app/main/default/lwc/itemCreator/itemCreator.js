import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Item__c';
import NAME_FIELD from '@salesforce/schema/Item__c.Name';
import REVENUE_FIELD from '@salesforce/schema/Item__c.itemcode__c';
import INDUSTRY_FIELD from '@salesforce/schema/Item__c.Precio__c';
export default class contactCreator extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Item creado",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}