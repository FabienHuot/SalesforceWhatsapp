public with sharing class SalesforceWhatsappIntegration {
   
    public SalesforceWhatsappIntegration() {
    }

    @AuraEnabled
    public static Boolean sendMessage(String contactId, String template){

        String token = 'EAAVf9iXpuPkBO3uEcCZAkLnkqUI0PJpQwgeSzNZBxJOmxwYS2xheO730BpJQ6fgyykXWhltddfhpmsHwI12PbzZAZCGlRBAsSCr7D7PWg6mpSJXxnyj7fdkqZAhTAcXL09WTYEWcxqzcOKZCOiFjYjySflRonyBKbiMHkJjUVYJDc05RRmySDRDDu1qyn85sD3obZBSTOZBizxZC9egZDZD';

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v17.0/135510506313793/messages');
        req.setHeader('Content-type', 'application/json');
        req.setMethod('POST');

        System.debug('textMessage : ' + template);      
        String body = '{ "messaging_product": "whatsapp", "to": "33665151837", "type": "template", "template": { "name": "'+template+'", "language": { "code": "en_US" } } }';
        req.setBody(body);
        
        req.setHeader('Authorization', 'Bearer ' + token);

        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            return true;
        }
        return false;
    }
}