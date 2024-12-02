@isTest
private class AccountProcessorTest {
    @isTest
    static void testCountContacts() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account(Name = 'Conta de Teste ' + i);
            accounts.add(acc);
        }
        insert accounts;


        List<Contact> contacts = new List<Contact>();
        for (Account acc : accounts) {
            Contact con = new Contact(AccountId = acc.Id, FirstName = 'First Name', LastName = 'Last Name');
            contacts.add(con);
        }
        insert contacts;

        List<Id> accountIds = new List<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        List<Account> updatedAccounts = [SELECT Number_Of_Contacts__c FROM Account WHERE Id IN :accountIds];
        for (Account acc : updatedAccounts) {
            System.assertEquals(contacts.size(), acc.Number_Of_Contacts__c);
        }
    }
}