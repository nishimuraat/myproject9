import { LightningElement } from 'lwc';
import SAMPLE_CSV from '@salesforce/resourceUrl/sample_csv';
import SAMPLE_JSON from '@salesforce/resourceUrl/sample_json';

export default class AccessToStaticresource extends LightningElement {

    executeCsvHandler()
    {
        var req = new XMLHttpRequest();
        req.open("get", SAMPLE_CSV, true);
        req.send(null);
        
        req.onload = function(){
            console.log(req.responseText);
        }
    }

    executeJsonHandler()
    {
        var req = new XMLHttpRequest();
        req.open("get", SAMPLE_JSON, true);
        req.send(null);
        
        req.onload = function(){
            console.log(JSON.parse(req.responseText));
        }
    }
}