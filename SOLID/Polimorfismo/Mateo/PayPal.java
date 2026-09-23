public class PayPal implements MetodoPago{
    private String correo;

    public PayPal(String correo){
        this.correo = correo;
    }

    @Override
    public boolean validar(){
        if (this.correo.contains("@")){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void pagar(double monto){
        System.out.println("Pago de $" + monto + " enviado a la cuenta PayPal: "+ this.correo);
    }
}