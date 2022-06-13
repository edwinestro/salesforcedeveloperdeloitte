public with sharing class BatchTestScheduleClass implements Schedulable {


    public void execute(SchedulableContext context) {

        InventoryDataScheduler ex = new InventoryDataScheduler();
        String cron = '0 19 * * *';
        String jobId = System.schedule('Process Apex Example', cron, ex);
    }

}