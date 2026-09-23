namespace OCP.Nucleo;

public class GestorDeAliens
{
    private List<(string Nombre, Func<IAlien> Crear, bool Desbloqueado)> _catalago = new()
    {
        ("Fuego, () => new Fuego(), true),
        ("Humungosaurio", () => new Humungosaurio(), true),
        ("Cuatro Brazos", () => new CuatroBrazos(), true)
    };
    private readonly List<(string Nombre, Func<IAlien> Crear)> _escanearADN = new();

    private readonly Dictionary<Type, Func<IAlien>> _supremos = new()
    {
     {typeof(HumungosaurioSupremo), () => new HumungosaurioSupremo()}   
    };
    private readonly List< string Nombre, Func<IAlien> Crear)> _fusiones = new()
    {
        ("Humungosaurio + CuatroBrazos", () => new Fusion<Humungosaurio,CuatroBrazos>()),
        ("Fuego + Cuatro Brazos", () => new Fusion<Fuego,CuatroBrazos>()),
        ("Fuego + Humungosaurio", () => new Fusion<Fuego, Humungosaurio>())
    };
    public List<(string Nombre, Func<IAlien>Crear)> ObtenerDesbloqueados()
    {
        var lista = _catalogo;
            .Where(a => a.Desbloqueado)
            .Select(a => (a.Nombre, a.Crear))
            .ToList();
        lista.AddRange(_escanerarADN);
        return lista;
    }
    public List<string> ObtenerDesbloqueados() => _catalogo.Where(a => a.Desbloqueado) .Select( a => a.nombre).ToList();

    public bool TieneSupremo(IAlien alien) => _supremos.ContainsKey(alien, GetType());            
    
}