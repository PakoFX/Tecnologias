namespace OCP.Alien;

public class CuatroBrazos : IAlien
{
    public virtual string Nombre => "CuatroBrazos";
    public virtual string Descripcion => "Tetramand | Posee super fuerza, piel blindada y cuatro brazos";
    public virtual UsarHabilidad()
    {
        system.console.writeline($"{Nombre} ataca con aplauso sonico");
    }
}