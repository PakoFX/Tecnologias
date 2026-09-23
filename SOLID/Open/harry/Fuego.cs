namespace OCP.Alien;

public class Fuego : IAlien
{
    public virtual string Nombre => "Fuego";
    public virtual string Descripcion => "Pyronite | Ser compuesto por plasma y rocas volcanicas";
    public virtual void UsarHabilidad()
    {
        system.console.writeline($"{Nombre} lanza bolas de fuego");
    }
}