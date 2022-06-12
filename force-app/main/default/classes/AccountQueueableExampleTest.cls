@isTest 
public class AccountQueueableExampleTest { 
    @testSetup 
    static void setup() { 
        List<Account> accounts = new List<Account>(); 
        // add 100 accounts 
        for (Integer i = 0; i < 100; i++) { 
            accounts.add(new Account( 
                name='Test Account'+i 
            )); 
        } 
        insert accounts; 
    } 
      
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class 
        List<Account> accounts = [select id, name from account where name like 'Test Account%']; 
        // Create our Queueable instance 
        AccountQueueableExample accQObj = new AccountQueueableExample(accounts); 
        // startTest/stopTest block to force async processes to run 
        Test.startTest();         
        System.enqueueJob(accQObj); 
        Test.stopTest();         
        // Validate the job ran 
        System.assertEquals(100, [select count() from account where Name like '%Bedu%']); 
    } 
      
} 