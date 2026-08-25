package Miguel;

public class BloqueMusical implements ActivablePorRedstone{
    @Override
    public void activar(){System.out.println("Bloque recibe señal y reproduce musica");}
    @Override
    public void desactivar(){System.out.println("Bloque recibe señal y deja de reproducir musica");}    
}
