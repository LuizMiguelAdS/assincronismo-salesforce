public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact() {
        return [
            SELECT FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
        ];
    }
}