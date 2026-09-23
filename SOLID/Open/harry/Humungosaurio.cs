namespace OCP.Alien;

public class Humongosaurio : IAlien
{
    public virtual string Nombre => "Humungosaurio";
    public virtual string Descripcion => "Vaxasaurio | Posee super fuerza y puede crecer hasta 20 metros";
    public virtual void UsarHabilidad()
    {
        system.console.writeline($"{Nombre} golpea el suelo y crea un mini terremoto");
    }
}