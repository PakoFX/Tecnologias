public class Contado implements MetodoPago {
    
    boolean Estadobilletes;

    public Contado(boolean Estadobilletes){
    this.Estadobilletes = Estadobilletes;
    }

    @Override
    public boolean validar(){
        if (Estadobilletes == true) {
            return true;
        }else{
            return false;
        }
    }

    @Override
    public void pagar(double monto){
        System.out.println("El billete esta en buen estado");
    }
}