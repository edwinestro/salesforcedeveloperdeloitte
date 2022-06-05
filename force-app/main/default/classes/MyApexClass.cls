public class MyApexClass implements InterfaceTest1 {
    public void metodo1() {
        System.debug('Hello Worlds');
    }
    
    public String  metodo2() {
        System.debug('Hello ');
    }
    
    public void  metodo3(String param1) {
        System.debug('Hello ' + param1);
    }
}
