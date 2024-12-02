@IsTest
public class AddPrimaryContactTest {
    @IsTest
    static void testAddPrimaryContact() {
        Contact testContact = new Contact();
        testContact.FirstName = 'Test';
        testContact.LastName = 'Contact';
        
        AddPrimaryContact job = new AddPrimaryContact(testContact, 'CA');
        System.enqueueJob(job);
        
        List<Account> testAccountsNY = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account account = new Account();
            account.Name = 'Test Account NY ' + i;
            account.BillingState = 'NY';
            testAccountsNY.add(account);
        }
        insert testAccountsNY;
        
        List<Account> testAccountsCA = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account account = new Account();
            account.Name = 'Test Account CA ' + i;
            account.BillingState = 'CA';
            testAccountsCA.add(account);
        }
        insert testAccountsCA;
        
        Test.startTest();
        Test.stopTest();
        
        List<Contact> insertedContacts = [SELECT Id FROM Contact WHERE Account.BillingState = 'CA' AND AccountId != null];
        System.assertEquals(50, insertedContacts.size());
    }
}