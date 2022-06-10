trigger myAccTriggerUpdate on Account (before insert, before update) {
    for(Account acc : trigger.new){
        if(acc.Website == null || acc.Website == ''){
            acc.adderror('La cuenta '+acc.AccountNumber+' no tiene sitio web. Favor dew captuirarlo.');
        }
    }
}