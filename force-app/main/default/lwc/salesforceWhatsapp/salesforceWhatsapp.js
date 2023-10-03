import { LightningElement, api } from 'lwc';
import sendMessage from '@salesforce/apex/SalesforceWhatsappIntegration.sendMessage';

export default class SalesforceWhatsapp extends LightningElement {

    @api recordId;

    SendThroughWhatsapp() {
        console.log('recordId : ', this.recordId);
        sendMessage({contactId : this.recordId})

        .then (results => {
            console.log('success : ', results);
        })

        .catch (results => {
            console.log('error : ', results);
        })
    }
}