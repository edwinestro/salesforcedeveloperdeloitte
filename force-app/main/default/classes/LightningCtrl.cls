public with sharing class LightningCtrl {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Name, Phone, Email From Contact limit 5];
    }
}