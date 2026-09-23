public class App{
    public static void main(String[] args) throws Exception{
        Caja caja = new Caja();

        MetodoPago tarjeta = new Tarjeta("1234567812345678");
        MetodoPago paypal = new PayPal("usuario@gmail.com");
        MetodoPago contado = new Contado(true);

        caja.cobrar(tarjeta, 500);
        caja.cobrar(paypal, 1000);
        caja.cobrar(contado, 1500);
    }
}