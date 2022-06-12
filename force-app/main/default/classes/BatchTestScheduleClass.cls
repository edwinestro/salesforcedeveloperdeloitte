public with sharing class BatchTestScheduleClass implements Schedulable {


    public void execute(SchedulableContext context) {

        BatchApexExample ex = new BatchApexExample();
        String cron = '20 30 8 10 2 ?';
        String jobId = System.schedule('Process Apex Example', cron, ex);
    }

}