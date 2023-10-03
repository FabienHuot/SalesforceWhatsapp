public with sharing class SalesforceWhatsappIntegration {
   
    public SalesforceWhatsappIntegration() {
    }

    @AuraEnabled
    public static String sendMessage(String contactId){
        return ([SELECT Phone FROM Contact WHERE Id = :contactId].Phone);
    }
}