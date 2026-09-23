type Plan = "basico" | "intermedio" | "chipocludo";

class User {
    constructor(
        private nombre: string,
        private email: string,
        private edad: number,
        private plan: Plan
    ) {}

    getEdad(): number {
        return this.edad;
    }

    getNombre(): string {
        return this.nombre;
    }

    getEmail(): string {
        return this.email;
    }

    getPlan(): Plan {
        return this.plan;
    }
}

class Validadora {
    validarUsuario(user: User): boolean {
        // Corrección: invocación con ()
        if (user.getNombre().trim().length < 1) {
            console.log(`Nombre inválido o demasiado corto.`);
            return false;
        }

        if (user.getEdad() < 16) {
            console.log("Debes ser mayor de 16 años para ingresar.");
            return false;
        }

        if (!user.getEmail().includes("@")) {
            console.log(`El email ${user.getEmail()} no es válido.`);
            return false;
        }

        return true;
    }
}

class Factura {
    calcularPrecio(user: User): number {
        const precios: Record<Plan, number> = {
            "basico": 300,
            "intermedio": 550,
            "chipocludo": 999,
        };
        return precios[user.getPlan()]; 
    }

    generarFactura(user: User): string {
        const fecha = new Date().toLocaleDateString();
        return `Club Deportivo [${fecha}] | Cliente: ${user.getNombre()} | Plan: ${user.getPlan()} | Total: $${this.calcularPrecio(user)}`;
    }
}

class ServicioCorreo {
    mandarEmailBienvenida(user: User): void {
        console.log(`Email enviado a: ${user.getEmail()}`);
        console.log(`¡Bienvenido ${user.getNombre()}!\n`);
    }
}

class RepositorioBD {
    guardarEnBD(user: User): boolean {
        console.log(`Insertando usuario en la base de datos...`);
        console.log(
            `INSERT INTO users(nombre, email, edad, plan) VALUES ('${user.getNombre()}', '${user.getEmail()}', ${user.getEdad()}, '${user.getPlan()}')`
        );
        return true;
    }
}

class ServicioDeportivo {
    constructor(
        private validador: Validadora,
        private servicioCorreo: ServicioCorreo,
        private repositorio: RepositorioBD,
        private facturadora?: Factura
    ) {}

    registrarSubscripcion(user: User): boolean {
        if (!this.validador.validarUsuario(user)) {
            console.log("No se pudo completar el registro: datos inválidos.\n");
            return false;
        }

        this.repositorio.guardarEnBD(user);
        this.servicioCorreo.mandarEmailBienvenida(user);

        if (this.facturadora) {
            console.log(this.facturadora.generarFactura(user));
        }

        console.log("Usuario registrado con éxito.");
        return true;
    }
}
        
const vaughan = new User("Vaughan", "lobita@gmail.com", 48, "chipocludo");
const facturacion = new Factura();
const britania = new ServicioDeportivo(
    new Validadora(),
    new ServicioCorreo(),
    new RepositorioBD(),
    facturacion
);

britania.registrarSubscripcion(vaughan);