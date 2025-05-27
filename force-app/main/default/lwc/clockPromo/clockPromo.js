import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class ClockPromo extends LightningElement {
    @api productID
    @api productImage
    record;

    clockInterval = null;
    hours = 1;
    minutes = 10;
    seconds = 59;

    @wire(getRecord, {recordId: '$productID', fields: ['Product2.Name']})
    product({data, error}) {
        if (data) {
            console.log({data})
            this.record = data;
        }

        if (error) {
            console.log({error})
        }
    }

    get productName() {
        return this.record && this.record.fields.Name.value;
    }

    updateTime() {
        if (this.seconds === 0) {
            this.seconds = 59;
            this.minutes--;
        }

        if (this.minutes === 0) {
            this.minutes = 59;
            this.hours--;
        }

        this.seconds--;
    }

    connectedCallback() {
        this.clockInterval = setInterval(() => {
            this.updateTime();
        }, 1000);
    }

    disconnectedCallback() {
        clearInterval(this.clockInterval);
        this.clockInterval = null;
    }
}