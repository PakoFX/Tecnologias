public class Tarjeta implements MetodoPago{
    public String numero;

    public Tarjeta(String numero){
    this.numero = numero;
    }
    
    @Override
    public boolean validar(){
        if(this.numero.length()==16){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public void pagar(double monto){
        System.out.println("Pago de $"+monto +" realizado con tarjeta "+this.numero);
    }
}