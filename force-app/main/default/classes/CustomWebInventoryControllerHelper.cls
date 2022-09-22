public with sharing class CustomWebInventoryControllerHelper {

    
    public String name;
    public String precioLista;
    public String idExterno;
    public String cantidadDisponible;
    
    public CustomWebInventoryControllerHelper(String nombre, String Listprice, String idExternal, String cantDis) {
        name = nombre;
        precioLista = Listprice;
        idExterno = idExternal;
        cantidadDisponible = cantDis;
    }

}