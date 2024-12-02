import { LightningElement, wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import getContact from '@salesforce/apex/ContactController.getContact';

const COLUMNS = [
    { label: 'Contact FirsstName', fieldName: FIRSTNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Contact LastName', fieldName: LASTNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'text' }
];
export default class ContactList extends LightningElement {
    columns = COLUMNS;
    @wire(getContact)
    contacts;
}