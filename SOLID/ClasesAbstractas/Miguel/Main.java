

public class Main {
    public static void main(String[] args){

    Piston miPiston = new Piston();
    Puerta miPuerta = new Puerta();
    Lampara miLampara = new Lampara();
    BloqueMusical MiBloqueMusical = new BloqueMusical();

    System.out.println("Se activa la palanca");
    miPiston.activar();
    miPuerta.activar();
    miLampara.activar();
    MiBloqueMusical.activar();

    System.out.println("Se desactiva la palanca");
    miPiston.desactivar();
    miPuerta.desactivar();
    miLampara.desactivar();
    MiBloqueMusical.desactivar();
    
    Zombie miZombie = new Zombie();
    Esqueleto miEsqueleto = new Esqueleto();

    miZombie.quemarEnLava();
    miEsqueleto.quemarEnLava();

    miZombie.atacar();
    miEsqueleto.atacar();
    


    }
}
