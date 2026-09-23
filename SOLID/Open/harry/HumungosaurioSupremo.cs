namespace OCP.Alien;

public class HumungosaurioSupremo : Humongosaurio
{
    public override string Nombre => "Humungosaurio Supremo";
    public override void UsarHabilidad()
    {
        base.UsarHabilidad();
        system.console.writeline($"{Nombre} lanza misiles de sus brazos");
    }
}