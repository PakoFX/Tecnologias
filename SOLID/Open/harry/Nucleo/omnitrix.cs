using OCP.Alien;

namespace OCP.Nucleo;

public class Omnitrix
{
    public IAlien? AlienActual { get; private set;}
    public bool EstaTransformado => AlienActual != null;
    public void Transformar(IAlien alien)
    {
        AlienActual = alien;
        system.console.writeline($"Transformacion completa. Ahora es {AlienActual.Nombre}");
    }

    public void Destransformar(IAlien alien)
    {
        if (AlienActual != null)
        {
            system.console.writeline($"Timeout. {AlienActual.Nombre} ahora es Ben.");
            AlienActual = null;
        }
    }
}