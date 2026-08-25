package Miguel;

public class Esqueleto extends MobHostil {

    public Esqueleto(){
        super("Esqueleto", 20);
    }
    
    @Override
    public void atacar(){
        System.out.println("El Esqueleto va hacia ti y te dispara.");
    }
    
}
