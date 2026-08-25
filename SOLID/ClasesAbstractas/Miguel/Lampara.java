package Miguel;

public class Lampara implements ActivablePorRedstone{
    @Override
    public void activar(){System.out.println("Lampara se enciende e ilumina");}
    @Override
    public void desactivar(){System.out.println("Lampara se desactiva");}
}