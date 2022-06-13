public with sharing class InventoryDataScheduler implements Schedulable {

    public void execute(schedulableContext sc){
        ExternalLegacyConnection();
    }

    @future
    public static void ExternalLegacyConnection() {
    }
}
